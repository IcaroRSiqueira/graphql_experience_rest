# frozen_string_literal: true

class CreatePolicies < ActiveRecord::Migration[7.1]
  def change
    create_table :policies do |t|
      t.string :data_emissao
      t.string :data_fim_cobertura
      t.json :segurado
      t.json :veiculo

      t.timestamps
    end
  end
end
