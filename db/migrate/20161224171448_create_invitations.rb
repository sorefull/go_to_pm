class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.string :secure_key
      t.string :email

      t.timestamps
    end
  end
end
