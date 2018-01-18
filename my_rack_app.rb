require 'rack'

app = proc do |env|
  ['400', {'Content-Type' => 'text/html'}, ['A blubones rack app.']]
end

Rack::Handler::WEBrick.run app