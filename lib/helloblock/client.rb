require 'helloblock/client/connection'
require 'helloblock/client/request'
require 'helloblock/client/endpoints'

module HelloBlock
  class Client
    attr_writer :network

    include Connection
    include Request
    include Endpoints

    def initialize

    end

    def network
      @env ||= :testnet # :mainnet
    end
  end
end
