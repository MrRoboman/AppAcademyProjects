require 'addressable/uri'
require 'rest-client'

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  begin
  puts RestClient.post(
    url,
    { user: { name: "Smizmo" } }
  )
rescue RestClient::Exception => e
  puts "No bueno! #{e.message}"
end
end

create_user
