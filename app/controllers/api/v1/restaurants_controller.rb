class Api::V1::RestaurantsController < Api::V1::ApplicationController
    protect_from_forgery :except => [:create]

    def index
        restaurants = Restaurant.page(params[:page]).per(params[:limit]).order(updated_at: :desc)
        serializer = ActiveModel::Serializer::CollectionSerializer.new(
            restaurants,
            serializer: Api::V1::RestaurantSerializer
        )
        render json: serializer.as_json
    end


    def search
        if params[:query].present? 
            query = query.where("name like '%" + params[:query] + "%'")
				         .where("area like '%" + params[:query] + "%'")
				         .where("price like '%" + params[:query] + "%'")
				         .uniq
				         .page(params[:page])
				         .per(params[:limit])
                         .order(updated_at: :desc)
        else
            query = Restaurant.page(params[:page]).per(params[:limit]).order(updated_at: :desc)
        end
        serializer = ActiveModel::Serializer::CollectionSerializer.new(
            query,
            serializer: Api::V1::RestaurantSerializer
        )
        render json: serializer.as_json
    end

    def create
        restaurant = Restaurant.new(restaurant_params)
        restaurant.save!
        serializer = Api::V1::RestaurantSerializer.new(restaurant)
        render json: serializer.as_json
    end


    private

    def restaurant_params
        params.require(:restaurant).permit(
            :name,
            :image_url,
            :area,
            :tel,
            :price,
            :address,
            :tabelog_url
        )
    end

    def restaurant_id_params
        params.require(:user_restaurant).permit(
            :restaurant_id
        )
    end
end

