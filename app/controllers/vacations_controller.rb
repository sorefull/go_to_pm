class VacationsController < ApplicationController
  def show
    @vacation = current_user.vactions.find(params[:id])
    render partial: 'vacation'
  end
end
