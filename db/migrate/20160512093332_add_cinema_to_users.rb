class AddCinemaToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :cinema, index: true, foreign_key: true
  end
end
