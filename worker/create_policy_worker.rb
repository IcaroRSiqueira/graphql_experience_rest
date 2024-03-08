class CreatePolicyWorker
  include Sneakers::Worker
  from_queue 'create_policy'

  def work(msg)
    err = JSON.parse(msg)
    if err["type"] == "error"
      $redis.incr "processor:#{err["error"]}"
    end
    ack!
  end
end