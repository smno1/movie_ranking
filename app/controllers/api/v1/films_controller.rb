class Api::V1::FilmsController < Api::V1::BaseController
    def info
        film = Film.find(params[:id])
        render(json: film.basic_info)
    end

    def on_screen
        render(json: Film.online_films)
    end
end
