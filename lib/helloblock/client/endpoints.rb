module HelloBlock
  class Client
    module Endpoints

      API_VERSION       = '/v1'

      ADDRESSES_PATH    = '/addresses/'
      UNSPENTS_PATH     = '/addresses/unspents'
      TRANSACTIONS_PATH = '/addresses/transactions'

      # client.unspents(addresses: ...) => method_missing(:unspents, addresses: ... )

      def method_missing(method, *args, &block)
        endpoint_defined?(method) ? navigate_to_path(method, args[0]) : super
      end

      # :unspents => UNSPENTS_PATH

      def endpoint_defined?(method)
        Endpoints.constants.include?("#{method.upcase}_PATH".to_sym)
      end

      # get(UNSPENTS_PATH, addresses: ...)

      def navigate_to_path(method, *args)
        path = Endpoints.const_get("#{method.upcase}_PATH".to_sym)
        get(path, args[0])
      end
    end
  end
end
