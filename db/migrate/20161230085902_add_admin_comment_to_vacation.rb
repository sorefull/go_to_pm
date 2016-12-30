class AddAdminCommentToVacation < ActiveRecord::Migration[5.0]
  def change
    add_column :vacations, :admin_comment, :text
  end
end
