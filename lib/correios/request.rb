module Correios
  module Request
    def self.post(uri, params)
      connection(uri).post do |request|
        request.body = params
      end
    end
    
    private
    
    def self.connection(uri)
      Faraday.new(url: uri) do |faraday|
        faraday.request :url_encoded
        # faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end