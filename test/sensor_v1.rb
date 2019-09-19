require 'net/http'
require 'uri'
require 'json'

uri = URI.parse("http://localhost:9292/data")

header = {'Content-Type': 'text/json'}
count = 20
wait = 1 # sec
data = {:name =>"ferm1",
        :timestamp => Time.now.to_i,
        :temp => 40.0,
        :sg => 1.060,
        :status => "ok"}

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
http.open_timeout = 2

1.upto(count) do

	request = Net::HTTP::Post.new(uri.request_uri, header)
	# update the time stamp
	data[:timestamp] = Time.now.to_i

	# temperature may randomly fluctuate in this model
	data[:temp] = 40.0 + rand(5.0)

	# sg should slowly decrease and floor out
  puts data
  data[:sg] = data[:sg] - (rand(8.0) / 1000.0)
  if data[:sg] < 1.005
    puts "floor!"
    data[:sg] = 1.005
  end

  data_point = [data[:name], data[:timestamp], data[:status], data[:temp], data[:sg]]

	request.body = data_point.to_json

	# Send the request
	response = http.request(request)
	puts "Sent: #{data}. Response: #{response.code}"

	sleep(wait)
end

# Send an error at the end
if true
	request = Net::HTTP::Post.new(uri.request_uri, header)
  data[:status] = "error reading data"
  data_point = [data[:name], data[:timestamp], data[:status], data[:temp], data[:sg]]

	request.body = data_point.to_json

	# Send the request
	response = http.request(request)
	puts "Sent: #{data}. Response: #{response.code}"
end



