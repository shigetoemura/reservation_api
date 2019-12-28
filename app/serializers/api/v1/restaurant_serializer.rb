class Api::V1::RestaurantSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :image_url,
             :area,
             :tel,
             :price,
             :address,
             :tabelog_url,
             :created_at,
             :updated_at

  def tel
    object.tel.to_s
  end

  def created_at
    object.created_at.to_i
  end

  def updated_at
    object.updated_at.to_i
  end
end

