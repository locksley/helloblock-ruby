require 'helloblock/client/connection'
require 'helloblock/client/request'
require 'helloblock/client/endpoints'
require 'helloblock/client/addresses'

module HelloBlock
  class Client
    attr_writer :env

    include Connection
    include Request
    include Endpoints
    include Addresses

    def initialize

    end

    def network
      @env ||= :testnet # :mainnet
    end

    def target_url
      "http://#{network}.helloblock.io"
    end
  end
end
