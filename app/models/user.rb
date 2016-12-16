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
#  start_date             :datetime         default("2016-12-16 08:39:33.510695"), not null
#  vacation_count         :integer
#  day_off_count          :integer
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :recoverable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :start_date, presence: true
  validates :start_date, date: { before_or_equal_to: Time.zone.now }

  has_many :vacations
end
