require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Cmply < OmniAuth::Strategies::OAuth2
      option :name, 'cmply'
      #option :client_options, {:authorize_path => '/oauth/authorize',:site => 'https://api.cmp.ly'}
      option :client_options, {:authorize_path => '/oauth/authorize',:site => 'https://cmply-lb-04-475861862.us-east-1.elb.amazonaws.com'}

      #uid { access_token.params[:user_id] }
      uid { raw_info['_id'] }

      info do
        {
          :nickname => raw_info['user_name'],
          :name => raw_info['full_name'],
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :image => raw_info['profile_image_url'],
          :description => raw_info['bio'],
          :email => raw_info['email']
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.load(access_token.get('/v2/users/verify-credentials.json').body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

      alias :old_request_phase :request_phase

      def request_phase
        screen_name = session['omniauth.params'] ? session['omniauth.params']['screen_name'] : nil
        if screen_name && !screen_name.empty?
          options[:authorize_params] ||= {}
          options[:authorize_params].merge!(:force_login => 'true', :screen_name => screen_name)
        end
        old_request_phase
      end

    end
  end
end
