class FacebookRichie
    @@token = "EAAUKcP9seZCoBAPmdoTbWbOIAN7qfNBuUX9UZBtb6ZCGI4nE1KlVNDxklcuUCRiKq82RZC1rajqQsBn6rYH5ZB6IoREGzyTqpeJLEMux63yszevizYCB8z0KmhoignPZBN7jQUqotR1Gy7252ZB1sHbPISPvWI8yVLTAGT394IHkgZDZD"
    @@url = "https://graph.facebook.com/v2.6/me/messages?access_token=#{@@token}"
    def self.respond(user_id, input)
        conn = Faraday.new(:url => @@url)
            conn.post do |req|
             req.url @@url
                req.headers['Content-Type'] = 'application/json'
                req.params['recipient'] = "{ 'id': '#{user_id}' }"
                req.params['message'] = check_for_attachment(input)
        end
    end
    
    def self.check_for_attachment(input)
        case input
             when 'Login'
            
              "{
            'attachment': {
           'type': 'template',
             'payload': {
                  'template_type': 'button',
                  'text': 'testing button',
                'buttons':[
             {
                'type': 'account_link',
                'url': 'https://fiduty-api-isuruv.c9users.io/omniauth/facebook',
             },
                  {
                  'type': 'postback',
                   'title': 'Chat',
                   'payload': 'USER_DEFINED_PAYLOAD'
                }
             ]
            }
        }
      }"
        else
            watson_response = WatsonMessenger.respond(input)
            "{ 'text': '#{watson_response}' }"
        end
    end
    
    
    def verify_current_user
        # "https://graph.facebook.com/v2.6/1381205945293947?fields=first_name,last_name,profile_pic,locale,timezone,gender&access_token=EAADPYz6FypkBAHUaU4HQW84m1WP5tpRF4YR6pSCZC8qY4WVZAT3LCEEgIZAjQ3XMJZAh8mwKJJPw1DDZCt0zGU8bvd5ZAoeQxbJVMLzKCOx23mefQA2nI2IltXi7oE65FtsZBD5n5QzNQcoSTIsGBHwbvLFlCNaBth8vgZCmZC1XWpAZDZD"
    end
    
    def self.fetch_psid(account_link_token)
        link_url = "https://graph.facebook.com/v2.6/me?access_token=#{@@token}&fields=recipient&account_linking_token=#{account_link_token}"
        conn = Faraday.new(:url => link_url)
            resp = conn.get do |req|
             req.url link_url
                req.headers['Content-Type'] = 'application/json'
        end
        resp.body
    end
    
    def fetch_picture_id_facebook_auth(user_id)
         conn = Faraday.new(:url => "https://graph.facebook.com/v2.6/#{user_id}?fields=first_name,last_name,profile_pic,locale,timezone,gender&access_token=EAADPYz6FypkBAHUaU4HQW84m1WP5tpRF4YR6pSCZC8qY4WVZAT3LCEEgIZAjQ3XMJZAh8mwKJJPw1DDZCt0zGU8bvd5ZAoeQxbJVMLzKCOx23mefQA2nI2IltXi7oE65FtsZBD5n5QzNQcoSTIsGBHwbvLFlCNaBth8vgZCmZC1XWpAZDZD")
            conn.get do |req|
             req.url "https://graph.facebook.com/v2.6/#{user_id}?fields=first_name,last_name,profile_pic,locale,timezone,gender&access_token=EAADPYz6FypkBAHUaU4HQW84m1WP5tpRF4YR6pSCZC8qY4WVZAT3LCEEgIZAjQ3XMJZAh8mwKJJPw1DDZCt0zGU8bvd5ZAoeQxbJVMLzKCOx23mefQA2nI2IltXi7oE65FtsZBD5n5QzNQcoSTIsGBHwbvLFlCNaBth8vgZCmZC1XWpAZDZD"
                req.headers['Content-Type'] = 'application/json'
        end
        
        response = JSON.parse(resp.body)
        response.profile_pic
    end
    
    def fetch_picture_id_messenger(user_id)
        conn = Faraday.new(:url => "https://graph.facebook.com/v2.6/#{user_id}?fields=first_name,last_name,profile_pic,locale,timezone,gender&access_token=EAAUKcP9seZCoBAPmdoTbWbOIAN7qfNBuUX9UZBtb6ZCGI4nE1KlVNDxklcuUCRiKq82RZC1rajqQsBn6rYH5ZB6IoREGzyTqpeJLEMux63yszevizYCB8z0KmhoignPZBN7jQUqotR1Gy7252ZB1sHbPISPvWI8yVLTAGT394IHkgZDZD")
            conn.get do |req|
             req.url "https://graph.facebook.com/v2.6/#{user_id}?fields=first_name,last_name,profile_pic,locale,timezone,gender&access_token=EAAUKcP9seZCoBAPmdoTbWbOIAN7qfNBuUX9UZBtb6ZCGI4nE1KlVNDxklcuUCRiKq82RZC1rajqQsBn6rYH5ZB6IoREGzyTqpeJLEMux63yszevizYCB8z0KmhoignPZBN7jQUqotR1Gy7252ZB1sHbPISPvWI8yVLTAGT394IHkgZDZD"
                req.headers['Content-Type'] = 'application/json'
        end
        
        response = JSON.parse(resp.body)
        response.profile_pic
    end
    
end