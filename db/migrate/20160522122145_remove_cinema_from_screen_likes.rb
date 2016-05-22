class RemoveCinemaFromScreenLikes < ActiveRecord::Migration
  def change
    remove_reference :screen_likes, :cinema, index: true, foreign_key: true
    remove_reference :screen_dislikes, :cinema, index: true, foreign_key: true
  end
end
