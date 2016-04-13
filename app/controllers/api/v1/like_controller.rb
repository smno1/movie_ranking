class Api::V1::LikeController < ApplicationController
    before_action :authenticate_with_token!, only: [:create]
    respond_to :json
    def create
        uid=current_user.id
        like= Like.where(:user_id=>uid,:film_id=>like_params[:film_id]).first
        dislike= Dislike.where(:user_id=>uid,:film_id=>like_params[:film_id]).first
        film = Film.find(params[:film_id])
        if like.present?
            if like.destroy
                render json: film.likes_and_dislikes(current_user.id), status: 200
            else
                render json: {errors: like.errors}, status: 422
            end
        else
            dislike.destroy if dislike.present?
            like=Like.new(like_params)
            like.user_id=uid
            if like.save
                render json: film.likes_and_dislikes(current_user.id), status: 201
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
