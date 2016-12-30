# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  secure_key :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Invitation < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  before_create :set_secure_key
  def set_secure_key
    self.secure_key = SecureRandom.hex(16)
  end

  after_create :send_invitation_email
  def send_invitation_email
   UserMailer.send_invitation(self).deliver_now unless ENV['RAILS_ENV'] == 'test'
  end

  has_one :user, foreign_key: :email, primary_key: :email, class_name: 'User'
end
