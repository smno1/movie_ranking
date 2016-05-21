class Api::V1::CinemasController < ApplicationController

    def index
        cs=Cinema.all
        render json: cs.to_json(:include=>{:screen=>{:only=>:number}},:except=>[:created_at, :updated_at])
    end

    def current_films
        cinema_films = Cinema.find(params[:id]).current_films
        render json: cinema_films.to_json(:include=>[{:categories=>{:only=>:name}},{:posters=>{:except=>:updated_at}}], 
        :except=>[:created_at, :updated_at])
    end

end
