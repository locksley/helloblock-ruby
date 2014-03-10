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
        format_batches(params)
        binding.pry
        connection.send(method.to_sym, path, params, headers).body
      end

      def headers
        { accept: '*/*', content_type: 'application/x-www-form-urlencoded; charset=UTF-8' }
      end

      def format_batches(params)
        params.each do |key, value|
          params[key] = value.join("&#{key}=") if value.is_a?(Array)
        end
      end
    end
  end
end
