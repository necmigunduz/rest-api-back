# spec/requests/measurements_spec.rb
require 'rails_helper'

RSpec.describe 'Measurements API' do
  # Initialize the test data
  let!(:user) { create(:user) }
  let!(:unit) { create(:unit) }
  let!(:measurements) { create_list(:measurement, 2, user_id: user.id, unit_id: unit.id) }
  let(:user_id) { user.id }
  let(:unit_id) { unit.id }
  let(:id) { measurements.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /units/:unit_id/measurements
  describe 'GET /units/:unit_id/measurements' do
    before { get '/measurements', params: {}, headers: headers }

    context 'when unit exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all unit measurements' do
        expect(json.size).to eq(2)
      end
    end
  end

  # Test suite for PUT /units/:unit_id/measurements
  describe 'POST /units/:unit_id/measurements' do
    let(:valid_attributes) { { value: 300, unit_id: unit_id, user_id: user_id }.to_json }

    context 'when request attributes are valid' do
      before do
        post "/units/#{unit_id}/measurements", params: valid_attributes, headers: headers
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when an invalid request' do
      before { post "/units/#{unit_id}/measurements", params: {}, headers: headers }

      it 'returns a failure message' do
        expect(response.body).to match(/Invalid submission/)
      end
    end
  end

  # Test suite for PUT /units/:unit_id/measurements/:id
  describe 'PUT /units/:unit_id/measurements/:id' do
    let(:valid_attributes) { { value: 300 }.to_json }

    before do
      put "/units/#{unit_id}/measurements/#{id}", params: valid_attributes, headers: headers
    end

    context 'when measurement exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      # it 'updates the measurement' do
      #   updated_measurement = Measurement.find(id)
      #   expect(updated_measurement.value).to match(/300/)
      # end
    end

    context 'when the measurement does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Measurement/)
      end
    end
  end

  # Test suite for DELETE /units/:id
  describe 'DELETE /units/:id' do
    before { delete "/units/#{unit_id}/measurements/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
