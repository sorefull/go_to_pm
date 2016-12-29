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

FactoryGirl.define do
  factory :invitation do
    secure_key "MyString"
    email "MyString"
  end
end
