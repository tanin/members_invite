require 'rails_helper'

describe MassInviteCreate do
  let(:members) { create_list(:member, 10) }
  let(:group) { create(:group) }

  describe '.call' do
    context 'when with no errors' do
      it 'creates invites' do
        expect{ described_class.(members.pluck(:id), group.id) }.to change(Invite, :count).by(10)
      end
    end

    context 'when with errors' do
      context 'when group not found' do
        it 'raises ActiveRecord::RecordNotFound' do
          expect{ described_class.(members.pluck(:id), nil) }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      context 'when some members not found' do
        it 'creates only existing members' do
          expect{ described_class.(members.pluck(:id) + [100, 101], group.id) }.to change(Invite, :count).by(10)
        end
      end
    end
  end

  describe '#not_found_member_ids' do
    it 'returns not found ids' do
      obj = described_class.(members.pluck(:id) + [100, 101], group.id)
      expect(obj.not_found_member_ids).to eq([100, 101])
    end
  end
end

