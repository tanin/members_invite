require 'rails_helper'

describe Group, type: :model do
  let(:group) { create(:group) }

  it 'creates group' do
    expect(group).to be_persisted
  end

  describe 'validations' do
    context 'when name' do
      context 'when blank' do
        it 'is not valid' do
          expect(build(:group, name: '')).to_not be_valid
          expect(build(:group, name: nil)).to_not be_valid
        end
      end
    end
  end
end
