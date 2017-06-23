class Group < ActiveRecord::Base
  default_scope { where(active: true) }
  validates :name, :description, presence: true
  
  has_many :group_requests
  has_many :messages
  
  has_many :user_groups, :class_name => 'UserGroup'
  has_many :users, :through => :user_groups

  
  #overiding delete cause we want to maintain all records for SEC
  def delete
    self.update(active: false)
  end
  
  def add_admin(current_user)
    self.user_groups.create(user_id: current_user.id, memeber_type: 'Admin' )
    # self.members.push(user)
  end
  
  def add_member(user)
    self.user_groups.create(user_id: user.id, memeber_type: 'Member')
  end
  
  def self.create_group(create_group_params, params, current_user)
      group = self.create(create_group_params)
      if params[:access_tokens]
        params[:access_tokens].each do |access_token|
            user = User.find_by(access_token: access_token)
          if user
          user.create_request(group, user.id, current_user)
          # group.users.push(user)
          end
        end
      end
        group.add_admin(current_user)
        group
  end
  
  def show_messages_serializer
    self.messages.map{ |message| {'message': message, 'user_name': message.user.name, 'user_image': message.user.image } }
  end
  
end
