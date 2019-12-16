class AddSaltHashToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :password_salt, :string
  	rename_column :users, :password, :password_hash
  end
end
