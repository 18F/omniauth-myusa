require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

set :run, false
set :raise_errors, true

log = File.new("app.log", "a+")
$stdout.reopen(log)
$stderr.reopen(log)
$stdout.sync = true
$stderr.sync = true

get '/' do
  content_type 'text/html'
  <<-END
<html>
  <body>
    <p>
      <a href="/auth/myusa">auth with io</a>
    </p>
  </body>
</html>
  END
end

get '/auth/myusa/callback' do
  content_type 'application/json'
  MultiJson.encode(request.env)
end

get '/auth/failure' do
  content_type 'application/json'
  MultiJson.encode(request.env)
end
