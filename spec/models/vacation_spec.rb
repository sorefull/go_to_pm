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

require 'rails_helper'

RSpec.describe Vacation, type: :model do
  it { should validate_presence_of(:vacation_type) }
  it { should validate_presence_of(:start_time) }

  context "if vacation" do
    before { allow(subject).to receive(:vacation?).and_return(false) }
    before { allow(subject).to receive(:approved?).and_return(false) }
    it { should_not validate_presence_of(:end_time) }
  end

  it { should belong_to(:user) }

  let!(:user) do
    create(:user)
  end

  context "vacation creation" do
    let!(:vacation) do
      create(:vacation, :past_vacation, user: user)
    end
    it 'vacation count should equal 1' do
      expect(Vacation.count).to eq(1)
    end
    it 'users vacation_count should be less than 0' do
      expect(User.first.vacation_count).to be < 0
    end
  end

  context "before save actions" do
    let!(:day_off_with_end_time) do
      create(:vacation, :past_day_off, end_time: Time.now, user: user)
    end
    it "should cut end time if it is day_off" do
      expect(day_off_with_end_time.end_time).to eq nil
    end
  end
end
