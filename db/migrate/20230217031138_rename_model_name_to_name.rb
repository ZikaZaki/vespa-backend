class RenameModelNameToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :motorcycles, :model_name, :name
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
