class Message < ActiveRecord::Base
    belongs_to :user
    belongs_to :group
    
    def user_name
        self.user
    end
    
    # def user_image
    #     self.user.image
    # end
    
end
