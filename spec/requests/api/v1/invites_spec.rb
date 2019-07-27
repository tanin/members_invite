require 'rails_helper'

describe 'Invites API', type: :request do
  describe 'POST /api/v1/invites' do
    let(:members) { create_list(:member, 10) }
    let(:group) { create(:group) }

    let(:valid_post_attributes) {
      {
        data: {
          type: 'invites',
          attributes: {
            member_ids: members.pluck(:id),
            group_id: group.id
          }
        }
      }
    }

    context 'when the request is valid' do
      before do
        post '/api/v1/invites', params: valid_post_attributes, as: :json
      end

      it 'creates 10 invites' do
        expect(Invite.count).to eq(10)
      end

      it 'returns success json' do
        expect(json[:data][:attributes][:invited_member_ids]).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        expect(json[:data][:attributes][:not_found_member_ids]).to eq([])
        expect(json[:data][:attributes][:group_id]).to eq(group.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before do
        valid_post_attributes[:data][:attributes][:group_id] = nil

        post '/api/v1/invites', params: valid_post_attributes
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json[:message]).to match(
          /Couldn't find Group with 'id'=/
        )
      end
    end
  end
end
