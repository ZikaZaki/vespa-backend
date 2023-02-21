class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :reserve_date
      t.date :returning_date
      t.references :user, null: false, foreign_key: true
      t.references :motorcycle, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
