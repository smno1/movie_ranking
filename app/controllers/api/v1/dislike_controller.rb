class Api::V1::DislikeController < ApplicationController
    before_action :authenticate_with_token!, only: [:create]
    respond_to :json
    def create
        uid=current_user.id
        dislike= Dislike.where(:user_id=>uid,:film_id=>dislike_params[:film_id]).first
        if dislike.present?
            if dislike.destroy
                render json: {dislikes: Dislike.count_dislike_by_film(dislike_params[:film_id]) }, status: 200
            else
                render json: {errors: dislike.errors}, status: 422
            end
        else
            dislike=Dislike.new(dislike_params)
            dislike.user_id=uid
            if dislike.save
                render json: {dislikes: Dislike.count_dislike_by_film(dislike.film_id)}, status: 201
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
