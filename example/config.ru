require 'bundler/setup'
require 'omniauth-myusa'
require './app.rb'

use Rack::Session::Cookie, :secret => 'secret'

# Get app_id and app_secret from OAuth Provider app.
#
# to set up a dummy app that points to a dev/staging version of myusa, add:
#     :client_options => {
#       :site => 'http://example.com',
#       :token_url => '/oauth/token'
#     }
# to `provider :myusa ...`
#
# Uncomment the following line with the url of this dummy app.
# OmniAuth.config.full_host = "http://dummy.example.com"
#
# To run the app, simply call `rackup` from the command line. If you would like to
# run as a daemon, call `rackup -D` ... if you do this, you should set up logging.

client_options = {
  site: 'https://myusa-staging.18f.us',
  token_url: '/oauth/token'
}

if ENV['VCAP_APPLICATION']
  vcap_application = JSON.parse(ENV['VCAP_APPLICATION'])
  url = vcap_application["application_uris"][0]
  OmniAuth.config.full_host = "http://#{url}"
end

use OmniAuth::Builder do
  provider :myusa, 
           ENV['APP_ID'], 
           ENV['APP_SECRET'], 
           scope: 'profile.email profile.last_name', 
           client_options: client_options
end

run Sinatra::Application
