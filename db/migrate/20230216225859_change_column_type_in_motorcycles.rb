class ChangeColumnTypeInMotorcycles < ActiveRecord::Migration[7.0]
  def change
    change_table :motorcycles do |t|
      t.change :model_no, :string
    end
  end
end
