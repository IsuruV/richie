class EtfSerializer < ActiveModel::Serializer
  attributes :id, :investment_name, :ticker, :last_price, :name, :fiduty_name

end