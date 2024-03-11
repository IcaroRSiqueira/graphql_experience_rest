class CreatePolicyWorker
  include Sneakers::Worker
  from_queue 'policies', routing_key: 'policies'

  def work(msg)
    parsed_msg = JSON.parse(msg, symbolize_names: true)
    created_policy = Policy.create!(parsed_msg)
    Rails.logger "Policy: #{create_policy} created successfully"

    if err["type"] == "error"
      $redis.incr "processor:#{parsed_msg["error"]}"
    end
    ack!
  end
end