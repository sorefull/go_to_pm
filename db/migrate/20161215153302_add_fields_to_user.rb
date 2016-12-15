class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string, null: false, default: ''
    add_column :users, :last_name, :string, null: false, default: ''
    add_column :users, :birth_date, :datetime
    add_column :users, :skype_username, :string
    add_column :users, :phone_number, :string
    add_column :users, :start_date, :datetime, null: false, default: Time.zone.now
  end
end
