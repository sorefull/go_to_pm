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

class Vacation < ApplicationRecord
  belongs_to :user
  validates :vacation_type, :start_time, presence: true
  validates :end_time, presence: true, if: :vacation?
  # validates :start_time, date: { after_or_equal_to: Date.today.beginning_of_day }
  validates :end_time, date: { after: :start_time }, if: :vacation?
  validates :offset, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: :workdays_in_range }, if: :vacation?

  before_save :set_users_counters_variables
  def set_users_counters_variables
    self.end_time = nil if self.day_off?
    user = User.find(self.user.id)
    if self.vacation?
      user.vacation_count -= self.workdays_in_range(self.offset)
      user.save
    elsif self.day_off?
      user.day_off_count -= 1
      user.save
    end
  end

  enum vacation_type: [:vacation, :day_off]

  scope :past, -> { where("start_time < ?", Date.today.beginning_of_day).order("start_time DESC") }
  scope :future, -> { where("start_time >= ?", Date.today.beginning_of_day).order("start_time ASC") }

  # offset is a non sun&sut holidays in range
  def workdays_in_range(offset=0)
    self.end_time ? (self.start_time.to_date..self.end_time.to_date).select { |d| (1..5).include?(d.wday) }.size - self.offset : 1
  end

  def destroy_vacation
    if self.vacation?
      user.vacation_count += self.workdays_in_range(self.offset)
      user.save
    elsif self.day_off?
      user.day_off_count += 1
      user.save
    end
    self.destroy
  end
end
