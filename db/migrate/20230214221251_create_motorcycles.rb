class CreateMotorcycles < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcycles do |t|
      t.integer :model_no
      t.string :model_name
      t.decimal :finance_fee
      t.decimal :purchase_fee
      t.date :production_date
      t.string :description

      t.timestamps
    end
  end
end
