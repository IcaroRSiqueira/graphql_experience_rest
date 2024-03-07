# The code in this file is for test only
require 'bunny'

connection = Bunny.new(host: '172.24.0.4', username: 'myuser', password: 'mypassword', vhost: '/')
connection.start

channel = connection.create_channel

exchange = channel.default_exchange

exchange.publish('Hello from Ruby App!', routing_key: 'create_policy')

sleep 1

puts 'Successfully sent'

connection.close