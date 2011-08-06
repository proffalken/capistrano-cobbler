require 'test/unit'
require 'capistranoCobbler'

class TestCobblerConnections < Test::Unit::TestCase
    def test_server_url
    	cobbler_connection = CapistranoCobbler.new('localhost')
    	assert_equal('localhost', cobbler_connection.cblr_server)
    end
end
