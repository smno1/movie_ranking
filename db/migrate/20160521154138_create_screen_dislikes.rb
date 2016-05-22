class CreateScreenDislikes < ActiveRecord::Migration
  def change
    create_table :screen_dislikes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :cinema, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
