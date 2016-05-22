class AddScreenToScreenLikes < ActiveRecord::Migration
  def change
    add_reference :screen_likes, :screen, index: true, foreign_key: true
    add_reference :screen_dislikes, :screen, index: true, foreign_key: true
  end
end
