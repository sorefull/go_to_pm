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

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  # it { should validate_presence_of(:start_date) }

  it { should have_many(:vacations) }

  let!(:user) do
    create(:user)
  end

  it 'user creation' do
    expect(User.count).to eq(1)
  end
end
