require 'rails_helper'

describe 'Members API', type: :request do
  describe 'POST /api/v1/members' do
    let(:valid_post_attributes) {
      {
        data: {
          type: 'members',
          attributes: {
            name: 'Vasia Pupkin',
            email: 'foo@bar.com'
          }
        }
      }
    }

    context 'when the request is valid' do
      before do
        post '/api/v1/members', params: valid_post_attributes, as: :json
      end

      it 'creates a member' do
        expect(resource).to be_persisted
      end

      it 'returns member json' do
        expect(json[:data][:id]).to eq(resource.id.to_s)
        expect(json[:data][:type]).to eq('members')
        expect(json[:data][:attributes][:name]).to eq('Vasia Pupkin')
        expect(json[:data][:attributes][:email]).to eq('foo@bar.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before do
        valid_post_attributes[:data][:attributes][:email] = nil

        post '/api/v1/members', params: valid_post_attributes
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json[:message]).to match(
          /Validation failed: Email can't be blank, Email is invalid/
        )
      end
    end
  end
end
