class CreateFilmsCategories < ActiveRecord::Migration
  def change
    create_table :films_categories do |t|
      t.references :film, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
