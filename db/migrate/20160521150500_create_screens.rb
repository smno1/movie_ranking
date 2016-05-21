class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string :number
      t.references :cinema, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
