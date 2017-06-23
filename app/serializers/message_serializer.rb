class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content
  attribute :user

    def user
     serializer = ActiveModel::Serializer.serializer_for(object.user).new(object.user)
     ActiveModel::Serializer::Adapter::Json.new(serializer).as_json
    end
    
end

