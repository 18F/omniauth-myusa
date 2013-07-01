require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Mygov < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "mygov"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {:site => "https://my.usa.gov", :token_url => "/oauth/authorize"}

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] || nil }

      info do
        {
          :email => raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/profile').parsed
      end
    end
  end
end