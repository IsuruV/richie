class UserSerializer < ActiveModel::Serializer
  has_many :followers, through: :follower_connections, source: :follower

  has_many :following, through: :following_connections, source: :following
end
