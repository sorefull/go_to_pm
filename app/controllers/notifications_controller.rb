class NotificationsController < ApplicationController
  def index
    Notification.where(status: :info).update_all(status: :warning)
    Notification.where(status: :unread).update_all(status: :info)
    @notifications = current_user.notifications.order('created_at DESC')
  end

  def destroy
    @notification = current_user.notifications.find(params[:id])
    @notification.destroy
  end
end
