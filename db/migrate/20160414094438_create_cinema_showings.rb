class CreateCinemaShowings < ActiveRecord::Migration
  def change
    create_table :cinema_showings do |t|
      t.references :cinema, index: true, foreign_key: true
      t.references :film, index: true, foreign_key: true
      t.date :on_date
      t.date :off_date

      t.timestamps null: false
    end
  end
end
