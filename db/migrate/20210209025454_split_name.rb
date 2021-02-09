class SplitName < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :name, :email, :password_digest
    # add_column :users, :last_name
  end
end
