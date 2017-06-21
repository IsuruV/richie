class GroupMembership < ActiveRecord::Base
#   groupify :group_membership
belongs_to :member, :class_name => :User, :foreign_key => 'member_id'
belongs_to :groups
end
