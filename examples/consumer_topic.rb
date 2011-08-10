require 'rubygems'
require 'stomp'


#client = Stomp::Client.new("failover://(stomp://:@localhost:61613,stomp://:@remotehost:61613)?initialReconnectDelay=5000&randomize=false&useExponentialBackOff=false")
client = Stomp::Client.new("guest", "guest", "localhost", 61613)

puts "Subscribing ronaldo"
client.subscribe("/topic/ronaldo", {:ack => "client", "activemq.prefetchSize" => 1, "activemq.exclusive" => true }) do |msg|
  puts msg.body
  client.acknowledge(msg)
end

loop do
  sleep(1)
end
