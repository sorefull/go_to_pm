class CreateVacations < ActiveRecord::Migration[5.0]
  def change
    create_table :vacations do |t|
      t.integer :vacation_type
      t.datetime :start_time
      t.datetime :end_time
      t.text :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
