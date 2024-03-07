# The code in this file is for test only

require 'bunny'

connection = Bunny.new(host: '172.24.0.4', username: 'myuser', password: 'mypassword', vhost: '/')
connection.start

channel = connection.create_channel

queue = channel.queue('create_policy', durable: true)

delivery_info, properties, payload = queue.pop

sleep 1

puts payload

connection.close