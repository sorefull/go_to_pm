class RemoveLastNameFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :last_name, :string
    remove_column :users, :first_name, :string
    add_column :users, :name, :string, null: false, default: 'New user'
  end
end
