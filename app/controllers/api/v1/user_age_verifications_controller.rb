class Api::V1::UserAgeVerificationsController < Api::V1::ApplicationController
    protect_from_forgery :except => [:create]

    def create
        UserVerification.create!(user_id: current_user.id, image_url: image_params, status: 0)
        render json: {message: "send image"}
    end

    def pass
        if UserVerification.find(params[:id]).status == 0
            user = UserVerification.find(params[:id])
            user.status = 1
            user.save!
            render json: {message: "success"}
        else
            render json: {message: "already passed"}
        end
    end

    def fail
        if UserVerification.find(params[:id]).status == 0
            UserVerification.find(params[:id]).destroy
            render json: {message: "success"}
        else
            render json: {message: "already passed"}
        end
    end

    private
    def image_params
        params.require(:image_url).permit(
            :image
        )
    end
end
