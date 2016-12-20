# == Schema Information
#
# Table name: vacations
#
#  id            :integer          not null, primary key
#  vacation_type :integer
#  start_time    :datetime
#  end_time      :datetime
#  comment       :text
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :vacation do
    start_time Faker::Date.forward(15)
    trait :vacation do
      vacation_type 0
      end_time Faker::Date.forward(15) + 15.day
    end
    trait :day_off do
      vacation_type 1
    end
  end
end
