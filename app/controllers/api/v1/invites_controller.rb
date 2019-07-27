class API::V1::InvitesController < ApplicationController
  def create
    creator = MassInviteCreate.(
      invites_params[:member_ids],
      invites_params[:group_id]
    )

    json_response creator, :created
  end

  protected

  def invites_params
    @invite_params ||= resource_params({ member_ids: [] }, :group_id)[:attributes]
  end
end
