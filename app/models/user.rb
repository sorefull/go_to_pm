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
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  birth_date             :datetime
#  skype_username         :string
#  phone_number           :string
#  start_date             :datetime         default("2016-12-15 16:17:36.856252"), not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :recoverable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :start_date, presence: true
end
