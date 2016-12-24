class Invitation < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  before_create :set_secure_key
  def set_secure_key
    self.secure_key = SecureRandom.hex(16)
  end

  after_create :send_invitation_email
  def send_invitation_email
   UserMailer.send_invitation(self).deliver_now
  end

  has_one :user, foreign_key: :email, primary_key: :email, class_name: 'User'
end
