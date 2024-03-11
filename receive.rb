# The code in this file is for test only

require 'bunny'

connection = Bunny.new(host: 'rabbitmq')
connection.start

channel = connection.create_channel

queue = channel.queue('create_policy', durable: true)

delivery_info, properties, payload = queue.pop

puts payload

connection.close