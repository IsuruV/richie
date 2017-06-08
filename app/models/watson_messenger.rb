class WatsonMessenger
    @@user_name = 'fac0895f-1e6a-4d07-bfbe-7cb792050184'
    @@password = 'EZVgaYTuelIu'
    
    def self.respond(input)
     conn = Faraday.new(:url => 'https://gateway.watsonplatform.net' ) do |faraday|
        faraday.response :logger
        faraday.basic_auth(@@user_name, @@password)
        faraday.adapter  Faraday.default_adapter
      end
      
      resp = conn.post do |req|
        req.url '/conversation/api/v1/workspaces/5386507a-1a1b-4112-9407-0b020bdb5a07/message?version=2017-05-26'
        req.headers['Content-Type'] = 'application/json'
        req.headers['Authorization'] = 'Basic ZmFjMDg5NWYtMWU2YS00ZDA3LWJmYmUtN2NiNzkyMDUwMTg0OkVaVmdhWVR1ZWxJdQ=='
        req.body = { "input" => { "text" => input} }.to_json
      end
      response = JSON.parse(resp.body)
      response['output']['text'][0]
    end 
    
end