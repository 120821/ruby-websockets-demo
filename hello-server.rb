require 'soap/rpc/standaloneServer'

class AddClass
	def add(i,j)
		return i.to_i + j.to_i
	end
end

class AddServer < SOAP::RPC::StandaloneServer
	def on_init
		add = AddClass.new
		add_method(add , 'add' , 'a' , 'b')
	end
end

server = AddServer.new('hello' , 'namespace' , '0.0.0.0' , 2000)
trap('INT'){ server.shutdown }
server.level=SOAP::RPC::StandaloneServer::DEBUG
server.start
