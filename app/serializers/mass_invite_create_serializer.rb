class MassInviteCreateSerializer < ActiveModel::Serializer
  attributes :invited_member_ids, :not_found_member_ids, :group_id

  def invited_member_ids
    object.members.ids
  end

  def group_id
    object.group.id
  end
end
