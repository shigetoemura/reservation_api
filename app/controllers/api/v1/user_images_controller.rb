class Api::V1::UserImagesController < Api::V1::ApplicationController
    before_action :authorize!
    protect_from_forgery :except => [:create]

    def create
        user_image = UserImage.create!(user_id: current_user.id, image_url: user_image_params)
        serializer = Api::V1::UserImageSerializer.new(user_image)
        render json: serializer.as_json
    end

    def update
        @user_image = UserImage.find(params[:id])
        if @user_image.update(user_image_params)
            serializer = Api::V1::UserImageSerializer.new(@user_image)
            render json: serializer.as_json
        end
    end


    private

    def user_image_params
        params.require(:user_image).permit(
            :image_url
        )
    end

end
