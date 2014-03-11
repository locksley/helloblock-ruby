module HelloBlock
  class Client
    module Endpoints

      ADDRESSES_PATH                = '/addresses/'
      UNSPENTS_PATH                 = '/addresses/unspents'
      TRANSACTIONS_FOR_ADDRESS_PATH = '/addresses/transactions'
      TRANSACTIONS_PATH             = '/transactions'
      LATEST_TRANSACTION_PATH       = '/transactions/latest'
      PROPAGATE_PATH                = '/transactions' # POST
      BLOCKS_PATH                   = '/blocks'
      LATEST_BLOCKS_PATH            = '/blocks/latest'
      WALLET_PATH                   = '/wallet'
      FAUCET_PATH                   = '/faucet'
      WITHDRAWAL_PATH               = '/withdrawal' # POST

      POST_REQUESTS                 = [:propagate, :withdrawal]

      def base_url
        "http://#{network}.helloblock.io"
      end

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
        post_request?(method) ? post(path, body: args[0]) : get(path, args[0])
      end

      def post_request?(method)
        POST_REQUESTS.include?(method)
      end
    end
  end
end
