# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Policies', type: :request do
  describe 'GET /policies/:policy_id' do
    subject(:request) { get "/policies/#{policy_id}" }

    context 'when policy exists' do
      let!(:policy) { create(:policy) }
      let(:policy_id) { policy.id }

      let(:expected_response) do
        {
          id: policy.id,
          data_emissao: policy.data_emissao,
          data_fim_cobertura: policy.data_fim_cobertura,
          segurado: policy.segurado,
          veiculo: policy.veiculo
        }
      end

      it 'returns 200' do
        request

        expect(response).to have_http_status(:ok)
      end

      it 'returns the policies info' do
        request

        expect(response.body).to include_json(expected_response)
      end
    end

    context 'when policy does not exists' do
      let(:policy_id) { 999_999 }

      it 'returns 404' do
        request

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
