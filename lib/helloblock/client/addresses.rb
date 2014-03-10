module HelloBlock
  class Client
    module Addresses

      def addresses(params={})
        get(Endpoints::ADDRESSES_PATH, params)
      end

      def unspents(params={})
        get(Endpoints::UNSPENTS_PATH, params)
      end

      def format_batches(key)
        params[key] = params[key].join("&#{key}=") if params[key].is_a?(Array)
      end
    end
  end
end
