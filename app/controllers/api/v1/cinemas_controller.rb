class Api::V1::CinemasController < ApplicationController

    def index
        cs=Cinema.all
        render json: cs.to_json(:except=>[:created_at, :updated_at])
    end

    def current_films
        cinema_films = Cinema.find(params[:id]).current_films
        puts("====================cinema_films")
        puts(cinema_films)
        render json: cinema_films
    end

end
