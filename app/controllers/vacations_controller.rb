class VacationsController < ApplicationController
  def requests
    @vacations = current_user.vacations.where(status: 'unapproved')
  end

  def show
    @vacation = current_user.vacations.find(params[:id])
    render partial: 'vacation'
  end

  def new
    @vacation = current_user.vacations.build(offset: 0)
  end

  def create
    @vacation = current_user.vacations.build(vacation_params)
    if @vacation.save
      redirect_to requests_path, notice: 'Request was sucessfuly created'
    else
      render 'new'
    end
  end

  private
  def vacation_params
    params.require(:vacation).permit(:vacation_type, :start_time, :end_time, :comment, :offset)
  end
end
