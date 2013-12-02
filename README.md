omniauth-yelp
=============

A ruby gem for yelp search API(OAuth) using omniauth
_______________________________________________________
This gem is based on intridea's omniauth gem :- https://github.com/intridea/omniauth/
____________________________________________________
Sample code  at initializers/omniauth.rb
require 'OmniAuth-yelp'
```
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :yelp,:consumer_key => 'your consumer key',:consumer_secret => 'your consumer secret',:token => 'your yelp token',:token_secret => 'your yelp token secret'
end
```
sample code at contrller action that handles the call back,say,results_controller#show
```
    def show
      @json_data = JSON.parse(ENV["YelpData"])
    end
```    
sample  search url that app should create to get a result at ENV["YelpData"]
```
	localhost:3000/auth/yelp/?term=cream+puffs&location=San+Francisco
```	
sample code to construct a search url from a serach form in rails(in haml)	
```
    %form{:action => "/auth/yelp/", :method => "GET"}
	  %label{:for => "term"} Search term
	  %input{:name => "term", :value => "cream puffs"}/
	  %br/
	  %label{:for => "term"} location
	  %input{:name => "location",:value => "San Francisco"}/
	  %br/
	  %input{:type => "submit"}/
```	  
sample code to construct a search url from a serach form in rails(in html)	
```
    <from action ="/auth/yelp/" method = "GET">
	  <label for="term">Search term</label>
	  <input name="term" ,value ="cream puffs"/>
	  <br/>
	  <label for="location">Location</label>
	  <input name="location" ,value ="Philadelphia"/>
	  <br/>
	  <input type="submit"/>
    </from>
```    
