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

require 'rails_helper'

RSpec.describe Invitation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
