require 'test/unit'
require 'capistrano-cobbler'

class TestCobblerConnections < Test::Unit::TestCase
    def test_server_url
    	cobbler_connection = CapCob::new(server='localhost')
    	assert_raise(GeneralException){'Could not connect to cobbler server on localhost'}
    end
end
