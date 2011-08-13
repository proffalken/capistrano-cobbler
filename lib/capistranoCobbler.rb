# This class enables Capistrano to retrieve the server-list of applicable nodes
# from Cobbler based upon the Management Class (mgmt_classes) defined for a node
class CapistranoCobbler

    attr_reader :mgmt_class
    attr_reader :server_list
    attr_reader :cobbler_server

    def initialize(mgmt_class,cobbler_server = "localhost")
        require 'xmlrpc/client'
        @cobbler_server = cobbler_server
        @mgmt_class = mgmt_class
        @connection = XMLRPC::Client.new2("http://#{cobbler_server}/cobbler_api")
    end

    def get_servers
        ok, servers = @connection.call2('find_system',:mgmt_classes => @mgmt_class)
        server_list = Array.new()
        for server_name in servers do 
	    ok, fqdn = @connection.call2('get_system_for_koan',server_name)
            server_list << fqdn['hostname']
        end
        
        return server_list
    end
end

