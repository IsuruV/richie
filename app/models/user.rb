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
  has_many :user_groups
  has_many :groups, :through => :user_groups
  
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
