require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  subject do 
    debugger
  end

  describe 'gel' do
    scenario ' has' do
      # subject
      expect(user.valid?).to eq(true)
    end
  end
end