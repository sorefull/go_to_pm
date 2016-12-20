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

require 'rails_helper'

RSpec.describe Vacation, type: :model do
  it { should validate_presence_of(:vacation_type) }
  it { should validate_presence_of(:start_time) }

  context "if vacation" do
    before { allow(subject).to receive(:vacation?).and_return(false) }
    it { should_not validate_presence_of(:end_time) }
  end

  let!(:user) do
    create(:user)
  end

  let!(:vacation) do
    create(:vacation, :vacation, user: user)
  end

  it 'vacation creation' do
    expect(Vacation.count).to eq(1)
  end

  it { should belong_to(:user) }

  context "before save actions" do
    let!(:day_off_with_end_time) do
      create(:vacation, :day_off, end_time: Time.now, user: user)
    end

    it "should cut end time if it is day_off" do
      expect(day_off_with_end_time.end_time).to eq nil
    end
  end


end
