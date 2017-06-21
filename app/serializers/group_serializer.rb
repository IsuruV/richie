class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :active, :users
  # has_many :group_memberships
  # has_many :members, :through => :group_memberships, source_type: "User"
  has_many :user_groups
  has_many :users, :through => :user_groups
end
