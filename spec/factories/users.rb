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
#  role                   :integer          default("0"), not null
#

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    password SecureRandom.hex(10)
    start_date Faker::Time.backward(1.year)
  end
end
