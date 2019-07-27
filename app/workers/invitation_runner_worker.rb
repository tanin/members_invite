class InvitationRunnerWorker < InvitationActionWorker
  def perform(*)
    collection.find_in_batches do |invites|
      InvitationActionWorker.perform_async(invites.pluck(:id))
    end
  end

  protected

  def collection
    @collection ||= Invite.where(sent_at: nil)
  end
end
