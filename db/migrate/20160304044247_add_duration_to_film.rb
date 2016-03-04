class AddDurationToFilm < ActiveRecord::Migration
  def change
    add_column :films, :duration, :string
  end
end
