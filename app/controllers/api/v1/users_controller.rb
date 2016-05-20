class Api::V1::UsersController < Api::V1::BaseController 
    before_action :authenticate_with_token!, only: [:update, :destroy,:is_user_sign_in, :set_default_cinema]
    respond_to :json
    def show
        respond_with User.find(params[:id])
    end

    def create
        user=User.new(user_params)
        if user.save
            render json: user, status: 201
        else 
            render json: {errors: user.errors}, status: 422
        end
    end

    def update
        user=current_user
        if user.update(user_params)
            render json: user, status: 200
        else
            render json: {errors: user.errors}, status: 422
        end
    end

    def destroy
        user=current_user
        user.destroy
        head 204
    end

    def is_user_sign_in
        render json: current_user, status: 200
    end

    def set_default_cinema
        user=current_user
        user.update(:cinema_id=>params[:cinema_id])
        render json: current_user, status: 200
    end

    private

    def user_params
        params.permit(:email, :password, :password_confirmation)
    end
end
