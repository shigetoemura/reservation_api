class Api::V1::CandidateDateSerializer < ActiveModel::Serializer
  attributes :id,
             :match_id,
             :timeframe,
             :date,
             :created_at,
             :updated_at


  def timeframe
    if object.timeframe == 1
      "morning time"
    elsif object.timeframe == 2
      "afternoon"
    end
  end

  def created_at
    object.created_at.to_i
  end

  def updated_at
    object.updated_at.to_i
  end
end

