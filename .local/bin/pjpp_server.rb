#! /bin/env ruby
require 'socket'
require 'timeout'

def port_listening?(ip, port, seconds=1)
  Timeout::timeout(seconds) do
    begin
      TCPSocket.new(ip, port).close
      true
    rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
      false
    end
  end
rescue Timeout::Error
  false
end

# check if search server is running on 8080
unless port_listening? "localhost", 8080
  puts "starting search server"
  system '/opt/pjpp_search/start'
end

unless port_listening? "localhost", 3000
  exec 'bundle exec script/server thin'
end