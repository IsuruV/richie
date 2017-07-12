class Group < ActiveRecord::Base
  default_scope { where(active: true) }
  validates :name, :description, presence: true
  
  has_many :group_requests
  has_many :messages
  
  has_many :user_groups, :class_name => 'UserGroup'
  has_many :users, :through => :user_groups
  has_many :suggestions
  has_many :group_investment_requests
  

  
  #overiding delete cause we want to maintain all records for SEC
  def delete
    self.update(active: false)
  end
  
  def group_investment_requests_serializer
    self.group_investment_requests.map{ |request| { 'id': request.id, 'etf': request.etf, 'group': self, 'description': request.description, 'requester': request.requester, 'amount': request.approvers.where('amount > 0').first.amount.to_i, 'approvers': request.approvers } }
  end
  
  def add_admin(current_user)
    self.user_groups.create(user_id: current_user.id, memeber_type: 'Admin' )
    # self.members.push(user)
  end
  
  def add_member(user)
    self.user_groups.create(user_id: user.id, memeber_type: 'Member')
  end
  
  def self.create_group(create_group_params, params, current_user)
    ## deduct from user creating group
    current_user.amount = current_user.amount - create_group_params[:minimum_amount].to_i
    current_user.save
    
      group = self.create(create_group_params)
      if params[:access_tokens]
        params[:access_tokens].each do |access_token|
            user = User.find_by(access_token: access_token)
          if user
          user.create_request(group, user.id, current_user, create_group_params[:minimum_amount].to_i)
          # group.users.push(user)
          end
        end
      end
        group.add_admin(current_user)
        group
  end
  
  def show_messages_serializer
    self.messages.map{ |message| {'message': message, 'user_name': message.user.name, 'user_image': message.user.image } }
  end
  
end
