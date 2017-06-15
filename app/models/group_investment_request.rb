class GroupInvestmentRequest < ApplicationRecord
    belongs_to :requester, foreign_key: :requester_id, class_name: 'User'
    has_one :etf
    has_many :approvers
    has_one :group_investment
    
    def create_approvers(group)
        group.members.each do |group_member|
            self.approvers.create(user_id: group_member.id, approved: false)
        end
    end
    
    def approve(user_id)
        approved_request = self.approvers.find_by(user_id: user_id)
        approved_request.update(approved: true)
        self.approve_confirmed
    end
    
    def approve_confirmed
        ticker = self.etf.symbol
        confirmation = self.approvers.all? { |x| x.approved == true }
        if confirmation
            self.create_investment
        end
    end
    
    def create_investment
        price = YahooApi.fetch_price(self.etf.symbol)
        self.group_investment.create(group_id: self.group_id, etf_id: self.etf_id, bought_price: price)
    end
    
end
