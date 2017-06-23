module ApplicationCable
  ## url format for wss: ws://localhost:3000/cable/?access-token=[ACCESS_TOKEN]&client=[CLIENT]&uid=[UID]
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    def connect

        params = request.query_parameters()

        access_token = params["access-token"]
        uid = params["uid"]
        client = params["client"]

        self.current_user = find_verified_user(access_token, uid, client)
        logger.add_tags 'ActionCable', current_user.email
    end
 
    protected
      # this checks whether a user is authenticated with devise
        def find_verified_user(token, uid, client_id)

            user = User.find_by(email: uid)
            if user && user.valid_token?(token, client_id)
                user
            else
                reject_unauthorized_connection
            end
        end   
  end
  
end