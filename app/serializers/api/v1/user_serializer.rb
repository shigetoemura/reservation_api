class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :user_images,
             :age,
             :introduction,
             :origin,
             :language,
             :height,
             :school,
             :work,
             :drink,
             :cigarette,
             :user_restaurants ,
             :created_at,
             :updated_at


  def user_images
    object.user_images
  end

  def user_restaurants 
    object.user_restaurants
  end

  def created_at
    object.created_at.to_i
  end

  def updated_at
    object.updated_at.to_i
  end

end
