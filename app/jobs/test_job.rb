# frozen_string_literal: true

require 'sidekiq-scheduler'

class TestJob
  include Sidekiq::Worker

  def perform
    Policy.create!(
      data_emissao: Date.current.to_s,
      data_fim_cobertura: (Date.current + 1.year).to_s,
      segurado: {
      nome: SecureRandom.alphanumeric + ' criado pelo cron',
      cpf: SecureRandom.uuid,
      },
      veiculo: {
        marca: 'Honda',
        modelo: 'Civic',
        ano: rand(1990...2020),
        placa: SecureRandom.alphanumeric
      }
    )
  end
end