module Admin
  class InvitationsController < ApplicationController
    def index
      @invitations = Invitation.all
    end

    def new
      @invitation = Invitation.new
    end

    def create
      invitation = Invitation.new(invitation_params)
      if !(User.find_by_email(invitation.email)) && invitation.save
        redirect_to admin_invitations_path, notice: 'Invitation was sent'
      else
        redirect_to admin_invitations_path, alert: 'This email is already used'
      end
    end

    def destroy
      @invitation = Invitation.find(params[:id])
      @invitation.destroy
      redirect_to admin_invitations_path, alert: 'Invitation was deleted and canceled'
    end

    private
    def invitation_params
      params.require(:invitation).permit(:email, :secure_key)
    end
  end
end
