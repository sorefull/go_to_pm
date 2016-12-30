module Admin
  class VacationsController < ApplicationController
    before_action :set_vacation, only: [:show, :destroy, :update, :request_show]
    before_action :set_user, only: [:new, :create]

    def index
      @vacations = Vacation.where(status: 1)
      authorize [:admin, @vacations]
    end

    def requests
      @vacations = Vacation.where(status: 0)
      authorize [:admin, @vacations]
    end

    def new
      @vacation = @user.vacations.build(offset: 0)
      authorize [:admin, @vacation]
    end

    def create
      @vacation = @user.vacations.build(vacation_params.merge(status: 1))
      if authorize [:admin, @vacation] && @vacation.save
        redirect_to [:admin, @user], notice: 'Vacation was sucessfuly created'
      else
        render 'new'
      end
    end

    def show
      authorize [:admin, @vacation]
      render partial: 'vacation'
    end

    def request_show
      authorize [:admin, @vacation]
      render partial: 'request'
    end

    def show_vacation
      @vacations = params[:type] == 'all' ? Vacation : Vacation.where(vacation_type: params[:type])
      authorize [:admin, @vacations]
      render partial: 'vacations'
    end

    def destroy
      if authorize [:admin, @vacation]
        if @vacation.start_time > Date.today || @vacation.unapproved?
          @vacation.destroy_vacation
          @vacation.user.notifications.create(body: "Your requestr for #{@vacation.vacation_type} in #{ @vacation.start_time.strftime("%A, %b %d")}#{ ' - ' +  @vacation.end_time.strftime("%A, %b %d") if @vacation.vacation_type == 'vacation' } was canceled!") unless params[:delete]
          redirect_to [:admin, @vacation.user], notice: 'Vacation was destroyed'
        else
          redirect_to [:admin, @vacation.user], alert: 'You only can delete future vacations'
        end
      end
    end

    def update
      if params[:delete]
        @vacation.user.notifications.create(body: "Your requestr for #{@vacation.vacation_type} in #{ @vacation.start_time.strftime("%A, %b %d")}#{ ' - ' +  @vacation.end_time.strftime("%A, %b %d") if @vacation.vacation_type == 'vacation' } was canceled!#{ (' Comment: ' + vacation_params[:comment]) if vacation_params[:comment] != '' }")
        destroy
      else
        if authorize [:admin, @vacation]
          @vacation.update(vacation_params.merge(status: :approved))
          @vacation.user.notifications.create(body: "Your requestr for #{@vacation.vacation_type} in #{ @vacation.start_time.strftime("%A, %b %d")}#{ ' - ' +  @vacation.end_time.strftime("%A, %b %d") if @vacation.vacation_type == 'vacation' } was approved!")
          redirect_to requests_admin_users_path, notice: 'Vacation was approved'
        end
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
end
