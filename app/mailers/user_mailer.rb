class UserMailer < ApplicationMailer
  def send_invitation(invitation)
    @invitation = invitation
    mail(to: @invitation.email, subject: 'Go to WEB!')
  end
end
