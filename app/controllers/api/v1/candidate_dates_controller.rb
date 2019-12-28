class Api::V1::CandidateDatesController < Api::V1::ApplicationController
    before_action :authorize!
    before_action :set_match, only: [:create, :accept]
    protect_from_forgery :except => [:create]

    def index
        candidates = CandidateDate.where(match_id: params[:match_id]).page(params[:page]).per(params[:limit]).order(updated_at: :desc)
        serializer = ActiveModel::Serializer::CollectionSerializer.new(
            candidates,
            serializer: Api::V1::CandidateDateSerializer
        )
        render json: serializer.as_json
    end

    def create
        dates = CandidateDate.new(date_params)
        dates.match_id =  params[:match_id]
        dates.save!
        render json: {message: "send candidates"}
    end

    def accept
        ActiveRecord::Base.transaction do
            date = CandidateDate.find(params[:id])
            if date.status == 1
                render json: {message: "already accepted"}
            else
                render json: {message: "accept the date"}
            end
            date.status = 1
            date.save!
        end
    end

    private

    def set_match
        @match = Match.find_by(id: params[:id])
    end

    def date_params
        params.require(:candidate_dates).permit(
            :timeframe,
            :date
        )
    end
end