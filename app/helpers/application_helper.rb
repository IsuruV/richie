module ApplicationHelper
    
    def fetch_token(user_params)
        user_info = {}
        user_info[:password] = user_params[:fd_id]
        user_info[:email] = user_params[:email]
     
        conn = Faraday.new(:url => 'https://richie-isuruv.c9users.io/')
        conn.post do |req|
            req.url 'auth/sign_in'
            req.headers['Content-Type'] = 'application/json'
            req.body = user_info.to_json
        end
        conn.resp.body
    end
end
