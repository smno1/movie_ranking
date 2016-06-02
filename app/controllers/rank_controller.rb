class RankController < ApplicationController
  def show_rank
    @films=Film.all.map do |f|
        {film_id: f.id, film_name: f.name, film_likes: f.likes.count, film_dislikes: f.dislikes.count}
    end
    @screens=Screen.all.map do |s|
       {screen_name: s.cinema.name+" screen "+s.number, screen_likes: s.screen_likes.count, screen_dislikes: s.screen_dislikes.count}
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: {film_rank: @films, screen_rank: @screens} }
    end

  end

  def film_screens
    @film=Film.find(params[:film_id])
    _screen_likes=@film.screen_likes.group(:screen_id).count
    _screen_dislikes=@film.screen_dislikes.group(:screen_id).count
    @flim_screen_likes=_screen_likes.map do |k,v|
        _sc=Screen.find(k)
        {screen: _sc.cinema.name+" screen "+_sc.number, likes: v}
    end
    @flim_screen_dislikes=_screen_dislikes.map do |k,v|
        _sc=Screen.find(k)
        {screen: _sc.cinema.name+" screen "+_sc.number, dislikes: v}
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: {screen_likes: @flim_screen_likes, screen_dislikes: @flim_screen_dislikes} }
    end
  end
end
