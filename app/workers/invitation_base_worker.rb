class InvitationBaseWorker
  include Sidekiq::Worker

  protected

  def collection
    @collection ||= Invite.where(sent_at: nil)
  end
end
