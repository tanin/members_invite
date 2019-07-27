require 'rails_helper'

describe InvitationActionWorker, type: :worker do
  let(:invite) { create(:invite, sent_at: DateTime.now) }
  let(:invites) { create_list(:invite, 10) }

  describe '#perform' do
    it 'finds all not sent invites by given ids and sends emails to all' do
      expect{ described_class.new.perform(invites.pluck(:id) + [invite.id]) }.to change {
        ActionMailer::Base.deliveries.count
      }.by(10)
    end
  end
end
