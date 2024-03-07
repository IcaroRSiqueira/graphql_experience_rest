# frozen_string_literal: true

class PoliciesController < ApplicationController
  # GET /policies/:policy_id
  def show
    render json: policy_information, status: :ok
  end

  private

  def policy_information
    Policy.select(
      :id, :data_emissao, :data_fim_cobertura, :segurado, :veiculo
    ).find(params.require(:policy_id))
  end
end
