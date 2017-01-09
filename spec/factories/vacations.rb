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
#  offset        :integer          default("0"), not null
#  status        :integer          default("0"), not null
#

FactoryGirl.define do
  factory :vacation do
    status 1
    trait :future_vacation do
      start_time Faker::Date.forward(15)
      end_time Faker::Date.forward(15) + 15.day
      vacation_type 0
    end
    trait :future_day_off do
      start_time Faker::Date.forward(15)
      vacation_type 1
    end
    trait :past_vacation do
      start_time Faker::Date.backward(15) - 15
      end_time Faker::Date.backward(15)
      vacation_type 0
    end
    trait :past_day_off do
      start_time Faker::Date.backward(15)
      vacation_type 1
    end
  end
end
