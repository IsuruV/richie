class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :messages
  has_many :suggestions
  has_many :followers
  has_many :single_investments
  
  #might not need b/c of groupify
  # has_many :user_groups
  # has_many :groups, :through => :user_groups
 
  has_many :follower_connections, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_connections, source: :follower

  has_many :following_connections, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_connections, source: :following
  
  has_many :group_requests
  
  groupify :group_member
  groupify :named_group_member
  

  def self.find_or_create_user_facebook(user_params)
      user = self.find_by(fd_id: user_params[:fd_id], name: user_params[:name])
    if !user
      user_params[:password] = user_params[:fd_id]
      user = self.create!(user_params)
    else
      user.update(age: user_params[:age], image: user_params[:image])
    end
      user
  end
end
