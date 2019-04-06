require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Kona < OmniAuth::Strategies::OAuth2
      BASE_DOMAIN = "io.kona.com"
      
      option :name, "kona"
      option :client_options, {
                 :site => "https://#{BASE_DOMAIN}",
                 :authorize_url => "https://#{BASE_DOMAIN}/oauth/authorize",
                 :token_url => "https://#{BASE_DOMAIN}/oauth/token"
                }

      def request_phase
        super
      end

      uid { raw_info['id']}

      info do
        {
            'email' => raw_info['email'],
            'name' => raw_info['name'],
            'image' => raw_info['picture_thumb']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @userinfo = access_token.get('/api/userinfo').parsed
        @raw_info ||= @userinfo['users'][0]
      end

      def callback_url
        full_host + script_name + callback_path
      end

    end
  end
end
