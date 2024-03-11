require 'sneakers'
Sneakers.configure  connection: Bunny.new(
 host: 'rabbitmq',
 logger: Rails.logger
)
Sneakers.logger = Rails.logger
Sneakers.logger.level = Logger::WARN