require 'oauth'
require 'omniauth'
module OmniAuth
  module Strategies
    class Yelp
      include OmniAuth::Strategy
      def request_phase
        redirect callback_url
      end
      extra do
        JSON.parse(@yelp_data_string)
      end
      def callback_phase
        consumer_key = options[:consumer_key]
        consumer_secret = options[:consumer_secret]
        oauth_token = options[:token]
        token_secret = options[:token_secret]
        consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {
                                :site               => 'http://api.yelp.com',
                                 :scheme             => :query_string,
                                 :http_method        => :get
                               })
        path  = "/v2/search?"+request.query_string
        this_token = OAuth::Token.new(oauth_token,token_secret)
        response = consumer.request(:get,path,this_token, { :scheme => :query_string })
        @yelp_data_string = response.body
        super
      end
    end
  end
end