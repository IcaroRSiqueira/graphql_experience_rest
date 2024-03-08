require 'sneakers'
Sneakers.configure  connection: Bunny.new(
 host: 'rabbitmq',
 username: 'myuser',
 password: 'mypassword',
 vhost: '/',
 logger: Rails.logger
),
exchange: 'sneakers',
exchange_type: :direct,
workers: 1,
env: ENV['RAILS_ENV'],
durable: true,
ack: true,
heartbeat: 30
Sneakers.logger = Rails.logger
Sneakers.logger.level = Logger::WARN