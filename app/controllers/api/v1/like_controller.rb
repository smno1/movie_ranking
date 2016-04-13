class Api::V1::LikeController < ApplicationController
    before_action :authenticate_with_token!, only: [:create]
    respond_to :json
    def create
        uid=current_user.id
        like= Like.where(:user_id=>uid,:film_id=>like_params[:film_id]).first
        if like.present?
            if like.destroy
                render json: {likes: Like.count_like_by_film(like_params[:film_id]), like_by_me: 0 }, status: 200
            else
                render json: {errors: like.errors}, status: 422
            end
        else
            like=Like.new(like_params)
            like.user_id=uid
            if like.save
                render json: {likes: Like.count_like_by_film(like.film_id),like_by_me: 1}, status: 201
            else
                render json: {errors: like.errors}, status: 422
            end
        end
    end



    private

    def like_params
        params.permit(:film_id)
    end
end
