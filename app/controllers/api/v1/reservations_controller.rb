class Api::V1::ReservationsController < Api::V1::ApplicationController
    before_action :authorize!
    before_action :set_reservation, only: [:destroy, :show, :accept, :cancel]
    before_action :set_match, only: [:create]
    before_action :set_candidate, only: [:create]
    protect_from_forgery :except => [:create]


    def create
        Reservation.create(first_name: reserve_params[:first_name],
                           last_name: reserve_params[:last_name],
                           phone_number: reserve_params[:phone_number],
                           match_id: @match.id,
                           candidate_date_id: @candidate.id,
                           status: 1
                        )
        render json: { message: "request reservation" }
    end

    def show
        serializer = Api::V1::ReservationSerializer.new(@reserve)
        render json: serializer.as_json
    end

    def destroy
        if !@reserve.status == 4
            @reserve.destroy
            render json: { message: "delete reservation" }
        else
            render json: { message: "You cannot delete the reservation" }
        end
    end

    def accept
        if @reserve.status ==  1
            @reserve.status = 2
            @reserve.save!
            render json: { message: "accept reservation" }
        else
            render json: { message: "already accepted" }
        end
    end

    def cancel
        if @reserve.status == 2
            @reserve.status = 3
            @reserve.save!
            render json: { message: "cancel reservation" }
        else
            render json: { message: "already canceled" }
        end

    end

    private
    def set_reservation
        @reserve = Reservation.find(params[:id])
    end

    def set_match
        @match = Match.find(params[:match_id])
    end

    def set_candidate
        @candidate = CandidateDate.find(params[:id])
    end

    def reserve_params
        params.require(:reservation).permit(
            :first_name,
            :last_name,
            :phone_number
        )
    end
end

