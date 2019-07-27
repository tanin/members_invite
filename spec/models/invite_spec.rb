require 'rails_helper'

describe Invite, type: :model do
  let(:invite) { create(:invite) }

  it 'creates invite' do
    expect(invite).to be_persisted
  end

  describe 'validates' do
    context 'when group is nil' do
      it 'is not valid' do
        expect(build(:invite, group: nil)).to_not be_valid
      end
    end

    context 'when member is nil' do
      it 'is not valid' do
        expect(build(:invite, member: nil)).to_not be_valid
      end
    end
  end
end
