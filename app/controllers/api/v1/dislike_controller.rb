class Api::V1::DislikeController < ApplicationController
    before_action :authenticate_with_token!, only: [:create]
    respond_to :json
    def create
        uid=current_user.id
        dislike= Dislike.where(:user_id=>uid,:film_id=>dislike_params[:film_id]).first
        like= Like.where(:user_id=>uid,:film_id=>dislike_params[:film_id]).first
        film = Film.find(params[:film_id])
        if dislike.present?
            if dislike.destroy
                render json: film.likes_and_dislikes(current_user.id), status: 200
            else
                render json: {errors: dislike.errors}, status: 422
            end
        else
            like.destroy if like.present?
            dislike=Dislike.new(dislike_params)
            dislike.user_id=uid
            if dislike.save
                render json: film.likes_and_dislikes(current_user.id), status: 201
            else
                render json: {errors: dislike.errors}, status: 422
            end
        end
    end



    private

    def dislike_params
        params.permit(:film_id)
    end
end
