class API::V1::MembersController < ApplicationController
  def create
    json_response resource, :created
  end

  def index
    json_response collection.page(params[:page])
  end

  protected

  def resource
    @resource ||= build_resource.tap(&:save!)
  end

  def build_resource
    Member.new(member_params)
  end

  def member_params
    @members_params ||= resource_params(:name, :email)[:attributes]
  end

  def collection
    @members ||= Member.all
  end
end
