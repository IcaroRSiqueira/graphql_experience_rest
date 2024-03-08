# The code in this file is for tests only
require 'bunny'

connection = Bunny.new(host: 'rabbitmq', username: 'myuser', password: 'mypassword', vhost: '/')
connection.start

channel = connection.create_channel

exchange = channel.default_exchange

exchange.publish('
Hello from Ruby App!', routing_key: 'create_policy')

sleep 1

puts 'Successfully sent'

connection.close