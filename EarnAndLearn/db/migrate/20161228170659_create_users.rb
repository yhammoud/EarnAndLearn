class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_Name
      t.string :last_Name
      t.string :email, null: false, default: ""
      t.integer :is_provider, :default => 0
      t.string :password_digest, null: false, default: ""
      t.timestamps
    end
  end
end
