class MemberInviteMailer < ApplicationMailer
  default from: 'invite@mobilize.io'

  def invite_member(invite)
    @member = invite.member
    @group = invite.group

    mail(
      to: @member.email,
      subject: "Invitation to #{@group.name}"
    )
  end
end
