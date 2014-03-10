require 'faraday_middleware'

module HelloBlock
  class Client
    module Connection
      attr_writer :connection_options

      private

      def connection
        @connection ||= Faraday.new(target_url, connection_options) do |connection|
          connection.request :json
          connection.response :json
          connection.use FaradayMiddleware::Rashify

          connection.adapter :net_http
        end
      end

      def connection_options
        @connection_options ||= {
          headers: {
            accept: 'application/json',
            user_agent: "HelloBlock Ruby Gem #{HelloBlock::VERSION}"
          },
          request: {
            open_timeout: 10,
            timeout: 30
          }
        }
      end
    end
  end
end




