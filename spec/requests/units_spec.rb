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
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /units/:id
  describe 'GET /units/:id' do
    before { get "/units/#{unit_id}", params: {}, headers: headers }

    context 'when the record exists' do

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
end