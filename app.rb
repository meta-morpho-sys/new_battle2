require 'sinatra'
set :session_secret, 'here be dragons'

get '/' do
  'hello!'
end

get '/secret' do
  'this is a secret page'
end

get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  "Hello #{params['name']}!"
end

get '/brilliant/:name' do |n|
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  # n stores params['name']
  "Bang! Bang! &#9889  #{n}, you are brilliant!!"
end

get '/say/*/to/*' do
  # matches /say/hello/to/world
  params['splat'] # => ["hello", "world"]
end

get '/download/*.*' do
  # matches /download/path/to/file.xml
  params['splat'] # => ["path/to/file", "xml"]
end

get'/Rocky' do
  "<style>
    #rocky {
    border: 3px dotted blue;
    padding: 30px;
    border-radius: 70px
    }
  </style>
  <div id=rocky>
   '<a href=https://imgur.com/tXiCbLu><img height=500 src=https://i.imgur.com/tXiCbLu.png title=source: imgur.com /></a>'
  </div>"
end