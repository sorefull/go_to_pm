module Admin
  class VacationsController < ApplicationController
    before_action :set_vacation, only: [:show, :destroy, :update, :request_show]
    before_action :set_user, only: [:new, :create]

    def index
      @vacations = Vacation.where(status: 1)
    end

    def requests
      @vacations = Vacation.where(status: 0)
    end

    def new
      @vacation = @user.vacations.build(offset: 0)
    end

    def create
      @vacation = @user.vacations.build(vacation_params.merge(status: 1))
      if @vacation.save
        redirect_to [:admin, @user], notice: 'Vacation was sucessfuly created'
      else
        render 'new'
      end
    end

    def show
      render partial: 'vacation'
    end

    def request_show
      render partial: 'request'
    end

    def show_vacation
      @vacations = params[:type] == 'all' ? Vacation : Vacation.where(vacation_type: params[:type])
      render partial: 'vacations'
    end

    def destroy
      if @vacation.start_time > Date.today
        @vacation.destroy_vacation
        redirect_to [:admin, @vacation.user], notice: 'Vacation was destroyed'
      else
        redirect_to [:admin, @vacation.user], alert: 'You only can delete future vacations'
      end
    end

    def update
      @vacation.approved!
      redirect_to requests_admin_users_path, notice: 'Vacation was approved'
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
end
