class Group < ActiveRecord::Base
  groupify :group
  
  has_many :group_requests
end
