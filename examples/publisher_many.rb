require 'rubygems'
require 'stomp'

#client = Stomp::Client.new("", "", "localhost", 61613)

#client = Stomp::Client.new("failover://(stomp://:@localhost:61613,stomp://:@remotehost:61613)?initialReconnectDelay=5000&randomize=false&useExponentialBackOff=false")
client = Stomp::Client.new("guest", "guest", "localhost", 61613)
message = "ronaldo #{ARGV[0]}"

for i in (1..300)
  puts "Sending message"
  client.publish("/topic/ronaldo", "#{i}: #{message}", {:persistent => true})
  puts "(#{Time.now})Message sent: #{i}"
end


for i in (1..100)
  puts "Sending message"
  client.publish("/topic/user_#{i}", "#{i}: a message to user #{i}", {:persistent => true})
  puts "(#{Time.now})Message sent: #{i}"
end


client.publish("/topic/hungryblank", "auch du mein sohn brutus", {:persistent => true})