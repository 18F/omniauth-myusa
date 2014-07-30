require 'bundler/setup'
require 'omniauth-myusa'
require './app.rb'

use Rack::Session::Cookie, :secret => 'secret'

use OmniAuth::Builder do
  provider :myusa, ENV['APP_ID'], ENV['APP_SECRET'], :scope => 'profile.email profile.last_name'
end

run Sinatra::Application
