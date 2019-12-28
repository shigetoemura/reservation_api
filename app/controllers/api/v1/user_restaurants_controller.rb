class Api::V1::UserRestaurantsController < Api::V1::ApplicationController
    before_action :authorize!
    before_action :set_restaurant, :except => [:create]
    protect_from_forgery :except => [:create]


    def create
            UserRestaurant.create!(user_id: current_user.id, restaurant_id: restaurant_params[:restaurant_id])

            render json: { message: "success" }
    end

    def update
        @user_restaurant.restaurant_id = restaurant_params[:restaurant_id]
        @user_restaurant.save!
        render json: { message: "success" }
    end

    def destroy
        user_restaurant = UserRestaurant.find(@user_restaurant.id)
        user_restaurant.destroy!
        render json: { message: "success" }
    end

    private

    def set_restaurant
        @user_restaurant = UserRestaurant.find(params[:id])
    end

    def restaurant_params
        params.require(:user_restaurant).permit(
            :restaurant_id
        )
    end

end
