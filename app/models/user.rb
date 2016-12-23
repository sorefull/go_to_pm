# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  birth_date             :datetime
#  skype_username         :string
#  phone_number           :string
#  start_date             :datetime
#  vacation_count         :integer          default("0"), not null
#  day_off_count          :integer          default("0"), not null
#  avatar                 :string
#  comment                :text
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :registerable, :recoverable

  validates :first_name, :last_name, :start_date, presence: true
  validates :start_date, date: { before_or_equal_to: Date.today.beginning_of_day }

  has_many :vacations, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
end
