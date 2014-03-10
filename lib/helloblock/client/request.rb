module HelloBlock
  class Client
    module Request

      def get(path, params={})
        request(:get, Endpoints::API_VERSION + path, params, headers)
      end

      def post(path, params={})
        request(:post, Endpoints::API_VERSION + path, params, headers)
      end

      private

      def request(method, path, params={}, headers={})
        response = connection.send(method.to_sym, path, params, headers)
        response.body
      end

      def headers
        { accept: '*/*', content_type: 'application/x-www-form-urlencoded; charset=UTF-8' }
      end
    end
  end
end
