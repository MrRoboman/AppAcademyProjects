class UpdateUserColumns < ActiveRecord::Migration
  def up
    remove_column :users, :email
    rename_column :users, :name, :username
  end

  def down
    add_column :users, :email, :string
    rename_column :users, :username, :name
  end
end
