#the main file of this gem
require 'omniauth-oauth2'
module OmniAuth
	module Strategies
		class yelp < OmniAuth::Strategies::OAuth2
		  option :name ,"Omniauth-Yelp"
		  option :client_options, {:site => "https://api.yelp.com"}
		  uid{raw_info['id']}
		  info do 
		  	{
		  		:name => raw_info['name'],
		  		:email => raw_info['email']
		  	}
		  end
		  extra do
		  	{
		       'raw_info' => raw_info
		    }
		  end	
		  def raw_info
		    @raw_info ||= access_token.get('/*').parsed
		  end
		  #a sample method used to learn
		  def self.hi(language = "english")
		    translator = Translator.new(language)
		    translator.hi
		  end
		  def request_phase
  			#redirect client.auth_code.authorize_url({:redirect_uri => callback_url}.merge(options.authorize_params))
		  end
		end
	end
end	
require "omniauth-yelp/translator"