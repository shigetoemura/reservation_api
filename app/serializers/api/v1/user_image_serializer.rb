class Api::V1::UserImageSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :image_url,
             :created_at,
             :updated_at


    def created_at
      object.created_at.to_i
    end

    def updated_at
      object.updated_at.to_i
    end
end
