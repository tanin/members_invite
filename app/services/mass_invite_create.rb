class MassInviteCreate
  include ActiveModel::Serialization

  attr_accessor :member_ids, :members, :group, :id

  def self.call(member_ids, group_id)
    obj = new(member_ids, group_id)
    obj.call
    obj
  end

  def call
    ActiveRecord::Base.transaction do
      # if DB supports, this will be a bulk insert
      Invite.create(
        members.map do |member|
          {
            member_id: member.id,
            group_id: group.id
          }
        end
      )
    end
  end

  def not_found_member_ids
    @not_found_members = member_ids - members.ids
  end

  protected

  def initialize(member_ids, group_id)
    @member_ids = member_ids

    # not existing members will be filtered out
    @members ||= Member.where(id: member_ids)

    @group ||= Group.find(group_id)
  end
end
