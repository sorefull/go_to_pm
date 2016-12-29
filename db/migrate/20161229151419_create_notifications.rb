class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :user, index: true
      t.integer :status, null: false, default: 0
      t.text :body

      t.timestamps
    end
  end
end
