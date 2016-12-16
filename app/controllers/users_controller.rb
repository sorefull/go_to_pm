class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :destroy, :show, :update]
  def index
    @users = User.paginate(:page => params[:page], :per_page => 4)
  end

  def show
  end

  def new
    @user = User.new
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
      redirect_to users_path, notice: "#{@user.first_name} was destroyed!"
    else
      redirect_to users_path, alert: 'You can not delete yourself'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :birth_date, :skype_username, :phone_number, :start_date)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
