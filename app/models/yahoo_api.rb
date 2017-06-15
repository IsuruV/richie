class YahooApi
    
  def self.fetch_price(ticker)
      yahoo_client = YahooFinance::Client.new
      # require 'pry'; binding.pry
      price = yahoo_client.quotes([ticker], [:last_trade_date,:last_trade_price])
      price_formatted = price[0]
      val = {"last_trade_date": price_formatted[:last_trade_date],"last_trade_price": price_formatted[:last_trade_price]}
      val
  end
    
end
