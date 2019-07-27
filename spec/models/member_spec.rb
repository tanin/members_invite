require 'rails_helper'

describe Member, type: :model do
  let(:member) { create(:member) }

  it 'creates member' do
    expect(member).to be_persisted
  end
end
