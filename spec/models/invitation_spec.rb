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
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should have_one(:user).with_foreign_key(:email).with_primary_key(:email).class_name('User') }

  let!(:invitation) do
    create(:invitation)
  end

  it 'invitation creation' do
    expect(Invitation.count).to eq(1)
  end

  it 'invitation secure_key' do
    expect(Invitation.first.secure_key.present?).to be true
  end
end
