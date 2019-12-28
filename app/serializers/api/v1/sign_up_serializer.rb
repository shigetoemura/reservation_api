class Api::V1::SignUpSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :age,
             :gender,
             :introduction,
             :origin,
             :language,
             :height,
             :school,
             :work,
             :drink,
             :cigarette,
             :token,
             :created_at,
             :updated_at

  def created_at
    object.created_at.to_i
  end
  
  def updated_at
    object.updated_at.to_i
  end

end
