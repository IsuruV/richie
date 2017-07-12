class GroupInvestmentRequest < ApplicationRecord
    belongs_to :requester, foreign_key: :requester_id, class_name: 'User'
    has_one :etf
    has_many :approvers
    has_one :group_investment
    belongs_to :group
   
    def etf
        Etf.all.find(self.etf_id)
    end
    
    def requester_serializer
        User.find(self.requester_id)
    end
    
    def create_approvers(group, user, amount)
        group.users.each do |group_member|
            self.approvers.create(user_id: group_member.id, approved: false)
        end
        self.self_approve(user, amount, group)
    end
    
    def self_approve(user, amount, group)
        # the user that created the request automatically should be approved
        approval = self.approvers.find_by(user: user)
        approval.update(approved: true, amount: amount)
    end
    
    def check_amount
        ## each member can not invest double the highest amount invested
    end
    
    def total_approval_amount
        self.approvals.inject(0){ |approval, x| approval.amount + x }
    end
    
    def approve(user_id, approve_status, amount)
        ## users enter the amount they want to invest along with their approval
        approved_request = self.approvers.find_by(user_id: user_id)
        approved_request.update(approved: approve_status, amount: amount)
        self.approve_confirmed
    end
    
    def approve_confirmed
        ticker = self.etf.symbol
        confirmation = self.approvers.all? { |x| x.approved == true }
        ##once all members approve execute transaction
        if confirmation
           { 'investment_made': true, 'investment': self.create_investment }
        end
           { 'investment_made': false, 'investment': self }
    end
    
    def create_investment
        price = YahooApi.fetch_price(self.etf.symbol)
        self.group_investment.create(group_id: self.group_id, etf_id: self.etf_id, bought_price: price, group_amount: self.total_approval_amount)
    end
    
    def manual_serialize
        { 'id': self.id, 'etf': self.etf, 'group': self.group, 'description': self.description, 'requester': self.requester, 'amount': self.approvers.where('amount > 0').first.amount.to_i, 'approvers': self.approvers }
    end
    
end
