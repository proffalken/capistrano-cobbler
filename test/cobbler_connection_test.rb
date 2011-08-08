require 'test/unit'
require 'capistranoCobbler'

class TestCobblerConnections < Test::Unit::TestCase
    def test_server_url
    	cobbler_connection = CapistranoCobbler.new('www','localhost')
    	assert_equal('localhost', cobbler_connection.cobbler_server)
    end

    def test_management_class_is_passed_correctly
    	cobbler_connection = CapistranoCobbler.new('www','localhost')
    	assert_equal('www',cobbler_connection.mgmt_class)
    end
end
