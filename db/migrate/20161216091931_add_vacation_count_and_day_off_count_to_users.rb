class AddVacationCountAndDayOffCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :vacation_count, :integer, null: false, default: 0
    add_column :users, :day_off_count, :integer, null: false, default: 0
  end
end
