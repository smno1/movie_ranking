class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :title
      t.string :image_url
      t.references :film, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
