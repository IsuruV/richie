class IndividualInvestment < ActiveRecord::Base
    belongs_to :user
    belongs_to :etf
    
    
    def create_investment
    end
    

end
