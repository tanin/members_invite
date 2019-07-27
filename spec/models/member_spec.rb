require 'rails_helper'

describe Member, type: :model do
  let(:member) { create(:member) }

  it 'creates member' do
    expect(member).to be_persisted
  end

  describe 'validations' do
    context 'when email' do
      context 'when blank' do
        it 'is not valid' do
          expect(build(:member, email: '')).to_not be_valid
          expect(build(:member, email: nil)).to_not be_valid
        end
      end

      context 'when not unique' do
        it 'is not valid' do
          expect(build(:member, email: member.email)).to_not be_valid
        end
      end

      context 'when not en email format' do
        it 'is not valid' do
          expect(build(:member, email: 'foo')).to_not be_valid
        end
      end
    end

    context 'when name' do
      context 'when blank' do
        it 'is not valid' do
          expect(build(:member, name: '')).to_not be_valid
          expect(build(:member, name: nil)).to_not be_valid
        end
      end
    end
  end
end
