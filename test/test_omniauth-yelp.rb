#test
require 'test/unit'
require 'omniauth-yelp'
class OmniauthYelpTest < Test::Unit::TestCase
	def test_english_hello
		 assert_equal "hello world",OmniauthYelp.hi("english")
	end	
	def test_any_hello
		assert_equal "hello world",OmniauthYelp.hi("ruby")
	end	
	def test_spanish_hello
		assert_equal "hola mundo",OmniauthYelp.hi("spanish")
	end	
end