class UserSerializer < ActiveModel::Serializer
  attributes :id, :image, :name, :first_name, :last_name, :email, :phone, :occupation, :age,
             :fb_friends, :recieved_group_requests, :amount
  
  has_many :followers, through: :follower_connections, source: :follower
  has_many :following, through: :following_connections, source: :following
  
  has_many :groups
  has_many :group_requests
  
  def fb_friends
    object.find_friends
  end
  
  def recieved_group_requests
    object.recieved_group_requests
  end
  
  def amount
    object.amount_serialize
  end
  

  
end