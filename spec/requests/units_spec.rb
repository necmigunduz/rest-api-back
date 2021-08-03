# spec/requests/units_spec.rb
require 'rails_helper'

RSpec.describe 'units API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let!(:units) { create_list(:unit, 10) }
  let(:unit_id) { units.first.id }
  let(:measurements) { create_list(:measurement, 20, user_id: user.id, unit_id: unit_id) }
  let(:headers) { valid_headers }

  # Test suite for GET /units
  describe 'GET /units' do
    # make HTTP get request before each example
    before do 
      measurements
      get '/units', params: {}, headers: headers
    end
    
    it 'returns units' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /units/:id
  describe 'GET /units/:id' do
    before { get "/units/#{unit_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the unit' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(unit_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:unit_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Unit with 'id'=#{unit_id}/)
      end
    end
  end

  # Test suite for POST /units
  describe 'POST /units' do
    # valid payload
    let(:valid_attributes) do
      { title: 'Learn Elm' }.to_json
    end

    context 'when the request is valid' do
      before { post '/units', params: valid_attributes, headers: headers }

      it 'creates a unit' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/units', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /units/:id
  describe 'PUT /units/:id' do
    let(:valid_attributes) { { title: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/units/#{unit_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /units/:id
  describe 'DELETE /units/:id' do
    before { delete "/units/#{unit_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end