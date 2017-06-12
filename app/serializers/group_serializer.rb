class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :active, :group_requests, :memebers
end
