module HelloBlock
  class Client
    module Addresses
      def addresses(address)
        get(HelloBlock::Client::ADDRESSES_PATH + address)
      end
    end
  end
end
