require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

set :run, false
set :raise_errors, true

get '/' do
  content_type 'text/html'
  <<-END
<html>
  <body>
    <link href='//fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link href='//s3.amazonaws.com/myusa-static/button.min.css' rel='stylesheet' type='text/css'>
    <p>
      <a href="/auth/myusa" class="btn btn-social btn-myusa">Connect with MyUSA</a>
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
