class GroupInvestment < ActiveRecord::Base
    belongs_to :group
    belongs_to :etf
    belongs_to :group_investment_request
    
    
end
