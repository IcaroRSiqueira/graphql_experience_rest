desc "create test message in rabbitmq"
task :create_message => :environment do
  require 'bunny'

  connection = Bunny.new(host: 'rabbitmq')
  connection.start

  channel = connection.create_channel
  queue = channel.queue('policies', durable: true)

  exchange = channel.default_exchange
  message = {
    data_emissao: '08-03-2024',
    data_fim_cobertura: '08-03-2025',
    segurado: {
      nome: 'Qualquer outro nome',
      cpf: '001.002.003-90'
    },
    veiculo: {
      marca: 'Honda',
      modelo: 'Fit',
      ano: '2007',
      placa: 'ABC-1234'
    }
}.to_json

  #exchange.publish(message, routing_key: 'policies')
  queue.publish(message, persistent: true, routing_key: 'policies')

  puts 'Successfully sent'

  connection.close
end