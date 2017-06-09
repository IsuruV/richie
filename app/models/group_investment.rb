class GroupInvestment < ActiveRecord::Base
    belongs_to :group
    belongs_to :etf
end
