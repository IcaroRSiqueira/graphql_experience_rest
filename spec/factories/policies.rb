# frozen_string_literal: true

FactoryBot.define do
  factory :policy do
    data_emissao { '2024-01-01' }
    data_fim_cobertura { '2025-01-01' }
    segurado do
      {
        "nome": 'Joao Silva',
        "cpf": '001.002.003-90'
      }
    end
    veiculo do
      {
        "marca": 'Fiat',
        "modelo": 'Uno 1.0',
        "ano": '1996',
        "placa": 'ABC-1234'
      }
    end
  end
end
