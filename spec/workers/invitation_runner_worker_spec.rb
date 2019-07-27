require 'rails_helper'

describe InvitationRunnerWorker, type: :worker do
  let!(:invite) { create(:invite, sent_at: DateTime.now) }
  let(:invites) { create_list(:invite, 10) }

  describe '#perform' do
    it 'finds all not sent invites and enqueues action worker' do
      expect(InvitationActionWorker).to receive(:perform_async).once.with(invites.pluck(:id))

      described_class.new.perform
    end
  end
end
