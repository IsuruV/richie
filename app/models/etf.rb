class Etf < ActiveRecord::Base
    has_one :individual_investment
    has_one :group_investment
end

