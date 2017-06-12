class Group < ActiveRecord::Base
   has_many :messages
   has_many :user_groups
   has_many :users, :through => :user_groups
   has_many :suggestions
   has_many :group_investments
   
   # attr_accessible :name, :description, :isPublic, :tag_list, :owner
end
