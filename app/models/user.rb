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
  
  has_many :user_choice_questions
  has_many :questions, :through => :user_choice_questions
  has_many :choices, :through => :user_choice_questions
  

  has_many :follower_connections, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_connections, source: :follower

  has_many :following_connections, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_connections, source: :following
  
  has_many :group_requests
  
  has_many :approvers
  
    #might not need b/c of groupify
  has_many :user_groups, :class_name => 'UserGroup'
  has_many :groups, :through => :user_groups
  

  def self.find_or_create_user_facebook(user_params)
      user = self.find_by(fd_id: user_params[:fd_id], name: user_params[:name])
    if !user
      user_params[:password] = user_params[:fd_id]
      user = self.create!(user_params)
    else
      user.update(age: user_params[:age], image: user_params[:image], access_token: user_params[:access_token], email: user_params[:email])
    end
      user
  end
  
  def self.name_search(name)
     if !name
        []
     else
      regexp = /#{name}/i
      result = order(:name).where("name ILIKE ?", "%#{name}%").limit(10)
      result.sort{|x, y| (x =~ regexp) <=> (y =~ regexp) }
     end
    
  end
  
  def get_friends_fb_ids
     begin
  
        graph = Koala::Facebook::API.new(self.access_token)
        friends = graph.get_connections("me", "friends", api_version: 'v2.0')
        friends.map{|friend| friend['id']}
     rescue
          []
      end
  end
  
  def find_friends
    begin
      fb_ids = self.get_friends_fb_ids
      User.where(fd_id: [fb_ids])
    rescue
      []
    end
  end
  
  def check_admin(group)
    user_group = group.user_groups.find_by(memeber_type: 'Admin', user_id: self.id)
    if user_group 
      true
    else
      false
    end
  end
  
  def recieved_group_requests
      self.group_requests.where(requested: false)
      # self.group_requests.groups.each{|group| group.user_groups.where(memeber_type: 'Admin')}
  end
  # def admin
  #   self.group_requests.groups.each{|group| group.user_groups.where(memeber_type: 'Admin')}
  # end
    
  def create_request(group, user_id, current_user, minimum_amount)
        GroupRequest.create(group_id: group.id, user_id: user_id,
                                                    message: "#{current_user.name} send you a request to join #{group.name}",
                                                    requested: false, minimum_amount: minimum_amount )
  end
  
  def amount_serialize
    self.amount.to_i
  end
  
end
