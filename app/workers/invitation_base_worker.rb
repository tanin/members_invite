class InvitationBaseWorker
  include Sidekiq::Worker

  protected

  def collection
    @collection ||= Invite.not_sent
  end
end
