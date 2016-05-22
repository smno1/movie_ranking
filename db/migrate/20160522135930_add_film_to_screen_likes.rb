class AddFilmToScreenLikes < ActiveRecord::Migration
  def change
    add_reference :screen_likes, :film, index: true, foreign_key: true
    add_reference :screen_dislikes, :film, index: true, foreign_key: true
  end
end
