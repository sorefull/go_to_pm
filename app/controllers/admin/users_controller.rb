module Admin
  class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :destroy, :show, :update]
    def index
      @users = User.all
    end

    def show
    end

    def show_vacation
      @user = User.find(params[:user_id])
      @vacations = params[:type] == 'all' ? @user.vacations : @user.vacations.where(vacation_type: params[:type])
      render partial: 'vacations'
    end

    def new
      @user = User.new(start_date: Time.zone.now)
    end

    def create
      @user = User.create(user_params.merge(password: SecureRandom.hex(10)))
      if @user.save
        redirect_to [:admin, @user], notice: 'User was sucessfuly created'
      else
        render 'new'
      end
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to [:admin, @user], notice: 'User was sucessfuly updated'
      else
        render 'edit'
      end
    end

    def destroy
      unless current_user == @user
        @user.destroy
        FileUtils.rm_rf("public/uploads/user/avatar/#{@user.id}")
        redirect_to admin_users_path, notice: "#{@user.first_name} was destroyed!"
      else
        redirect_to admin_users_path, alert: 'You can not delete yourself'
      end
    end

    private
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :birth_date, :skype_username, :phone_number, :start_date, :avatar, :comment, :vacation_count, :day_off_count)
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
