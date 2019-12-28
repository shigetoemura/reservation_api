class Api::V1::ReservationSerializer < ActiveModel::Serializer
  attributes :id,
             :match,
             :first_name,
             :last_name,
             :candidate_date,
             :created_at,
             :updated_at




  def created_at
    object.created_at.to_i
  end

  def updated_at
    object.updated_at.to_i
  end
end
