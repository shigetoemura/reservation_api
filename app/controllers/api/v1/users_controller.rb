class Api::V1::UsersController < Api::V1::ApplicationController
	before_action :authorize!
	before_action :set_user, except: [:men, :women]
	protect_from_forgery :except => [:create]

	def men
		if current_user.gender == 2
			men = User.where(gender: 1).page(params[:page]).per(params[:limit]).order(updated_at: :desc)
            serializer = ActiveModel::Serializer::CollectionSerializer.new(
                men,
                serializer: Api::V1::UserSerializer
            )
            render json: serializer.as_json
        else
            render json: { message: "You can not see same gender users." }
        end
	end

	def women
        if current_user.gender == 1
            women = User.where(gender: 2).page(params[:page]).per(params[:limit]).order(updated_at: :desc)
            serializer = ActiveModel::Serializer::CollectionSerializer.new(
            women,
            serializer: Api::V1::UserSerializer
            )
            render json: serializer.as_json
        else
            render json: { message: "You can not see same gender users." }
        end
    end

    def show
    	serializer = Api::V1::UserSerializer.new(@user)
    	render json: serializer.as_json
    end

    def blocks
    	UserBlock.create!(user_id: current_user.id, block_user_id: @user.id)
    	render json: { message: "success" }
    end

    def reports
    	UserReport.create!(user_id: current_user.id, report_user_id: @user.id)
        render json: { message: "success" }
    end

    def update
        if params[:user_params][:name].present?
            @user.name = params[:user_params][:name]
        end

        if params[:user_params][:age].present?
            @user.bio = params[:user_params][:age]
        end

        if params[:user_params][:introduction].present?
            @user.job = params[:user_params][:introduction]
        end

        if params[:user_params][:height].present?
            @user.income = params[:user_params][:height]
        end

        if params[:user_params][:school].present?
            @user.origin = params[:user_params][:school]
        end

        if params[:user_params][:work].present?
            @user.height = params[:user_params][:work]
        end

        if params[:user_params][:drink].present?
            @user.height = params[:user_params][:drink]
        end

        if params[:user_params][:cigarette].present?
            @user.height = params[:user_params][:cigarette]
        end

        if @user.save
            serializer = Api::V1::UserSerializer.new(@user)
            render json: serializer.as_json
        end
    end

    private

    def user_params
        params.require(:user_params).permit(
            :name,
            :age,
            :introduction,
            :height,
            :school,
            :work,
            :drink,
            :cigarette
        )
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end
end
