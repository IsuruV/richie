class FacebookRichiesController < ApplicationController
    def facebook_auth
        if params["hub.challenge"]
            render plain: params["hub.challenge"]
        else
            user_message = params["entry"][0]["messaging"][0]["message"]["text"]
            user_id = params["entry"][0]["messaging"][0]["sender"]["id"]
            
            FacebookRichie.respond(user_id, user_message)
        end
    end
    
end