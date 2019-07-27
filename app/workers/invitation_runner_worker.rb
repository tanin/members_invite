class InvitationRunnerWorker < InvitationActionWorker
  def perform(*)
    collection.find_in_batches do |invites|
      InvitationActionWorker.perform_async(invites.pluck(:id))
    end
  end
end
