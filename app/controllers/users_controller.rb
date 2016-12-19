class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :destroy, :show, :update]
  def index
    @users = User.all
  end

  def show
    params['period'] ||= 'future'
    @past_vacations = @user.vacations.where("start_time < ?", Date.today.beginning_of_day)
    @future_vacations = @user.vacations.where("start_time > ?", Date.today.beginning_of_day)
  end

  def new
    @user = User.new(start_date: Time.zone.now)
  end

  def create
    @user = User.create(user_params.merge(password: SecureRandom.hex(10)))
    if @user.save
      redirect_to users_path, notice: 'User was sucessfuly created'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was sucessfuly updated'
    else
      render 'edit'
    end
  end

  def destroy
    unless current_user == @user
      @user.destroy
      FileUtils.rm_rf("public/uploads/user/avatar/#{@user.id}")
      redirect_to users_path, notice: "#{@user.first_name} was destroyed!"
    else
      redirect_to users_path, alert: 'You can not delete yourself'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :birth_date, :skype_username, :phone_number, :start_date, :avatar, :comment)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
