class UpdateUsersColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :first_Name, :first_name
    rename_column :users, :last_Name, :last_name
  end
end
