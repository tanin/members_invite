class API::V1::MembersController < ApplicationController

  # POST /members
  def create
    json_response resource, :created
  end

  protected

  def resource
    @resource ||= build_resource.tap(&:save!)
  end

  def build_resource
    Member.new(member_params)
  end

  def member_params
    params.require(:data).permit(
      { attributes: %i[name email] }
    )
  end

  def member_attributes
    rental_unit_params[:attributes] || {}
  end
end
