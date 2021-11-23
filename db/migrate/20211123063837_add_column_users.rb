class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remember_token, :string
    change_column :users, :name, :string, null: false
    change_column :users, :email, :string, null: false
    change_column :users, :password_digest, :string, null: false
  end
end
