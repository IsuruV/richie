class IndividualInvestment < ActiveRecord::Base
    belongs_to :user
    has_one :indiviual_investment
    belongs_to :etf
    
    
end
