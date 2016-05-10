class RemoveCategoryFromFilm < ActiveRecord::Migration
  def change
    remove_reference :films, :category, index: true, foreign_key: true
  end
end
