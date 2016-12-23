class VacationsController < ApplicationController
  before_action :set_vacation, only: [:show, :destroy]
  before_action :set_user, only: [:new, :create]

  def index
    @vacations = Vacation.all
  end

  def new
    @vacation = @user.vacations.build(offset: 0)
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

  def show_vacation
    @vacations = params[:type] == 'all' ? Vacation : Vacation.where(vacation_type: params[:type])
    render partial: 'vacations'
  end

  def destroy
    if @vacation.start_time > Date.today
      @vacation.destroy_vacation
      redirect_to @vacation.user, notice: 'Vacation was destroyed'
    else
      redirect_to @vacation.user, alert: 'You only can delete future vacations'
    end
  end

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
