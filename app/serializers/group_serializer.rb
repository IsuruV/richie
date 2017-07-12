class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :active, :users, :messages, :group_investment_requests, :minimum_amount
  # has_many :group_memberships
  # has_many :members, :through => :group_memberships, source_type: "User"
  has_many :user_groups
  has_many :users, :through => :user_groups
  has_many :messages
  # has_many :group_investment_requests
  
  def messages
    object.show_messages_serializer
  end
  
  def group_investment_requests
    object.group_investment_requests_serializer
  end
  
end
