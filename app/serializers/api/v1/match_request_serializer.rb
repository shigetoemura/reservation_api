class Api::V1::MatchRequestSerializer < ActiveModel::Serializer
  attributes :id,
             :request_users,
             :restaurants,
             :created_at,
             :updated_at

  def initialize(object, options = {})
    @request_users = options[:request_users]
    super
  end

  def id
    object.id
  end

  def request_users
    request_user = @request_users.find{ |t| t[:id] == object.from_user_id}
    Api::V1::UserSerializer.new(request_user)
  end

  def restaurants
    object.user_restaurant_id
  end

  def created_at
    object.created_at.to_i
  end

  def updated_at
    object.updated_at.to_i
  end

end
