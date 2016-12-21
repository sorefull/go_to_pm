class VacationsController < ApplicationController
  before_action :set_vacation, only: [:show] # :destroy
  before_action :set_user, only: [:new, :create]

  def index
    @vacations = Vacation.all
  end

  def new
    @vacation = @user.vacations.build
  end

  def create
    @vacation = @user.vacations.build(vacation_params)
    if @vacation.save
      redirect_to @user, notice: 'Vacation was sucessfuly created'
    else
      render 'new'
    end
  end

  def show
    render partial: 'vacation'
  end

  # def destroy
  #   @vacation.destroy
  #   redirect_to @vacation.user, notice: 'Vacation was destroyed'
  #   @user.destroy
  #   redirect_to @user, notice: "#{@user.first_name} was destroyed!"
  # end

  private
  def vacation_params
    params.require(:vacation).permit(:vacation_type, :start_time, :end_time, :comment, :offset)
  end

  def set_vacation
    @vacation = Vacation.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
