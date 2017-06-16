class Group < ActiveRecord::Base
  default_scope { where(active: true) }
  validates :name, :description, presence: true
  groupify :group
  has_many :group_memberships
  has_many :members, :through => :group_memberships, source_type: "User"
  
  # groupify :group, members: [:users], default_members: :users
  has_many :group_requests
  has_many :messages
  
  # has_many :user_groups
  # has_many :users, :through => :user_groups
  
  #overiding delete cause we want to maintain all records for SEC
  def delete
    self.update(active: false)
  end
end
