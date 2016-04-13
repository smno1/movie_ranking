class Api::V1::FilmsController < Api::V1::BaseController
    before_action :authenticate_with_token!, only: [:likes_and_dislikes]

    def info
        film = Film.find(params[:id])
        render(json: film.basic_info)
    end

    def on_screen
        render(json: Film.online_films)
    end

    def likes_and_dislikes
        film = Film.find(params[:film_id])
        render json: film.likes_and_dislikes(current_user.id)
    end
end
