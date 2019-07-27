require "rails_helper"

describe MemberInviteMailer, type: :mailer do
  describe 'invite_member' do
    let(:invite) { create(:invite) }
    let(:mail) { described_class.invite_member(invite) }

    it 'renders the headers' do
      expect(mail.subject).to eq("Invitation to #{invite.group.name}")
      expect(mail.to).to eq([invite.member.email])
      expect(mail.from).to eq(['invite@mobilize.io'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match("Hi #{invite.member.name}, welcome to mobilize!")
    end
  end
end
