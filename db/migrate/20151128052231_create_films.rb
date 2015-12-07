class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name
      t.text :description
      t.date :released_date
      t.string :trailer_link
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
