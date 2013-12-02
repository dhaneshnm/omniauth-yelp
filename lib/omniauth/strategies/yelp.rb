require 'cgi'
require 'uri'
require 'oauth2'
require 'omniauth'
require 'timeout'
require 'securerandom'
require 'openssl' 
require 'base64'
require 'net/http'
module OmniAuth
  module Strategies
    class Yelp
      include OmniAuth::Strategy
      option :yelp_url ,"http://api.yelp.com/v2/search"
      def request_phase
          url = options[:yelp_url]+"?"+request.query_string
          parsed_url = URI.parse( url )
          Net::HTTP.start( parsed_url.host ) { | http |
            params = sign(parsed_url,'GET')
            signed_req = get_query_string(params)
            req = Net::HTTP::Get.new "#{ parsed_url.path }?#{ signed_req }"
            response = http.request(req)
            ENV["YelpData"] = response.read_body
            re_url = callback_url
            redirect re_url
          }
      end
      def percent_encode( string )
        return URI.escape( string, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]") ).gsub('*', '%2A')
      end
      def signature base_str
          key = percent_encode( options[:consumer_secret] ) + '&' + percent_encode( options[:token_secret] )
          digest = OpenSSL::Digest::Digest.new( 'sha1' )
          hmac = OpenSSL::HMAC.digest( digest, key, base_str )
          Base64.encode64( hmac ).chomp.gsub( /\n/, '' )
      end
      def get_query_string params
          pairs = []
          params.sort.each { | key, val | 
            pairs.push( "#{ percent_encode( key ) }=#{ percent_encode( val.to_s ) }" )
          }
          pairs.join '&'
      end
      def sign( parsed_url ,req_method)
          params = {
            'oauth_consumer_key' => options[:consumer_key],
            'oauth_token' =>options[:token],
            'oauth_nonce' => Array.new( 5 ) { rand(256) }.pack('C*').unpack('H*').first,
            'oauth_signature_method' => 'HMAC-SHA1',
            'oauth_timestamp' => Time.now.to_i.to_s,
            'oauth_version' =>'1.0'
          }
          if parsed_url.query
            params.merge! CGI.parse( parsed_url.query )
          end
          req_url = parsed_url.scheme + '://' + parsed_url.host + parsed_url.path
          base_str = [ 
            req_method, 
            percent_encode( req_url ),
            percent_encode( get_query_string(params) ) 
            
          ].join( '&' )
          params[ 'oauth_signature' ] = signature(base_str)
          return params
      end
    end
  end
end