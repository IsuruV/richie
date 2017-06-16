class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :active
end
