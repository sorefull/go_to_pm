# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  status     :integer          default("0"), not null
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Notification, type: :model do
  it { should belong_to(:user) }

end
