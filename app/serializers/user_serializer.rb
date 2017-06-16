class UserSerializer < ActiveModel::Serializer
  attributes :id, :image, :name, :first_name, :last_name, :email, :phone, :occupation, :age
  
  has_many :followers, through: :follower_connections, source: :follower
  has_many :following, through: :following_connections, source: :following
end