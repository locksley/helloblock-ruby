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

    def env
      @env ||= :development
    end

    def target_url
      case env
      when :development then Endpoints::DEVELOPMENT_ENDPOINT
      when :test        then Endpoints::TEST_ENDPOINT
      when :production  then Endpoints::PRODUCTION_ENDPOINT
      end
    end
  end
end
