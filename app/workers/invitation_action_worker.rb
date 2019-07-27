class InvitationActionWorker < InvitationBaseWorker
  def perform(ids)
    collection.each do |invite|
      MemberInviteMailer.invite_member(invite).deliver
    end
  end
end
