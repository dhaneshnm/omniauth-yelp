require 'oauth'
require 'omniauth'
module OmniAuth
  module Strategies
    class Yelp
      include OmniAuth::Strategy
      def request_phase
        consumer_key = options[:consumer_key]
        consumer_secret = options[:consumer_secret]
        oauth_token = options[:token]
        token_secret = options[:token_secret]
        consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {
                                :site               => 'http://api.yelp.com',
                                 :scheme             => :query_string,
                                 :http_method        => :get,
                                 :request_token_path => "/v2/search",
                                 :access_token_path  => "/v2/search",
                                 :authorize_path     => "/v2/search"
                               })
        path  = "/v2/search?term=noodle&location=Philadelphia"
        this_token = OAuth::Token.new(oauth_token,token_secret)
        response = consumer.request(:get,path,this_token, { :scheme => :query_string })
        ENV["YelpData"] = response.body
        @yelp_data_string = response.body
        puts callback_url
        redirect callback_url
      end
      extra do
        JSON.parse(ENV["YelpData"])
      end
      def callback_phase
        super
      end
    end
  end
end