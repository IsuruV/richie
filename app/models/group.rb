class Group < ActiveRecord::Base
  default_scope { where(active: true) }
  
  groupify :group
  has_many :group_requests
  has_many :messages
  
  #overiding delete cause we want to maintain all records for SEC
  def delete
    self.update(active: false)
  end
end
