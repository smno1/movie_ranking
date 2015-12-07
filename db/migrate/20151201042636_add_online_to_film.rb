class AddOnlineToFilm < ActiveRecord::Migration
  def change
    add_column :films, :online, :boolean
  end
end
