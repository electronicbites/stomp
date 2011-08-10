require 'rubygems'
require 'stomp'

#client = Stomp::Client.new("", "", "localhost", 61613)

#client = Stomp::Client.new("failover://(stomp://:@localhost:61613,stomp://:@remotehost:61613)?initialReconnectDelay=5000&randomize=false&useExponentialBackOff=false")
client = Stomp::Client.new("guest", "guest", "localhost", 61613)
message = "ronaldo #{ARGV[0]}"
client.publish("/topic/ronaldo", "1: #{message}", {:persistent => true})
client.publish("/topic/hungryblank", "auch du mein sohn brutus", {:persistent => true})