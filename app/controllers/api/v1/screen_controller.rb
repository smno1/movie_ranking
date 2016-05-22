class Api::V1::ScreenController < ApplicationController
  before_action :authenticate_with_token!, only: [:like_screen, :dislike_screen]
  def screen_preference
    screen = Screen.find(params[:screen_id])
    render json: screen.likes_and_dislikes(current_user.id)
  end

  def like_screen
    uid=current_user.id
    like= ScreenLike.where(:user_id=>uid,:screen_id=>like_params[:screen_id]).first
    dislike= ScreenDislike.where(:user_id=>uid,:screen_id=>like_params[:screen_id]).first
    screen = Screen.find(params[:screen_id])
    if like.present?
        if like.destroy
            render json: screen.likes_and_dislikes(current_user.id), status: 200
        else
            render json: {errors: like.errors}, status: 422
        end
    else
        dislike.destroy if dislike.present?
        _like=ScreenLike.new(like_params)
        _like.user_id=uid
        if _like.save
            render json: screen.likes_and_dislikes(current_user.id), status: 201
        else
            render json: {errors: _like.errors}, status: 422
        end
    end
  end

  def dislike_screen
    uid=current_user.id
    like= ScreenLike.where(:user_id=>uid,:screen_id=>dislike_params[:screen_id]).first
    dislike= ScreenDislike.where(:user_id=>uid,:screen_id=>dislike_params[:screen_id]).first
    screen = Screen.find(params[:screen_id])
    if dislike.present?
        if dislike.destroy
            render json: screen.likes_and_dislikes(current_user.id), status: 200
        else
            render json: {errors: dislike.errors}, status: 422
        end
    else
        like.destroy if like.present?
        _dislike=ScreenDislike.new(dislike_params)
        _dislike.user_id=uid
        if _dislike.save
            render json: screen.likes_and_dislikes(current_user.id), status: 201
        else
            render json: {errors: _dislike.errors}, status: 422
        end
    end
  end

  private

    def like_params
        params.permit(:screen_id)
    end
    def dislike_params
        params.permit(:screen_id)
    end
end
