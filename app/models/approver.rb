class Approver < ActiveRecord::Base
    belongs_to :group_investment_request
    belongs_to :user
end