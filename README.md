CapistranoCobbler
=================

This recipe for cobbler enables you to use the management classes in cobbler to automatically determine the nodes you will deploy your code to.

Installation is simple:

1. Copy capistranoCobbler.rb from 'lib' to the config directory in your pre-capified project
2. Update your CapFile as follows:
    ```ruby
    set :mgmt_class, "www"    
    set :mgmt_server, "localhost"
    ```

3. Update config/deploy.rb (or the appropriate staging file!) with the following:
    ```ruby
    load 'config/capistranoCobbler'  
    capcob = CapistranoCobbler.new(mgmt_class,cobbler_server=mgmt_server)  
    role(:web) do  
        capcob.get_servers  
    end
    ```

4. Run capistrano as you usually would.

NB: This assumes that you are deploying to a single server.  If you wanted to deplot to multiple servers, simply create additional connections and execute them as part of a "role" block:
    ```ruby
    # deploy.rb
    load 'config/capistranoCobbler'
    dbcc = CapistranoCobbler.new('database_servers','cobbler')
    webcc = CapistranoCobbler.new('web_servers','cobbler')
    appcc = CapistranoCobbler.new('app_servers','cobbler')

    role(:db) do
       dbcc.get_servers
    end
    role(:web) do
	webcc.get_servers
    end
    role(:app) do
	appcc.get_servers
    end
    ```
Please log tickets as necessary in github.

