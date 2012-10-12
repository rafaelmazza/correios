module Correios
  BUSCA_CEP_URL = 'http://www.buscacep.correios.com.br/servicos/dnec/consultaLogradouroAction.do'
  
  class CEP
    def self.search(zipcode)
      zipcode = zipcode.gsub(/\D/, '')
      return {error: 'Invalid zipcode format'} unless valid_zipcode?(zipcode)
      begin
        response = Correios::Request.post(BUSCA_CEP_URL, params(zipcode))
        Correios::Parser.new(response.body).parse
      rescue Correios::Parser::ZipcodeNotFound => error
        {error: error.message}
      rescue Faraday::Error::ConnectionFailed => e
        {error: 'Service unavailable'}
      end
    end
    
    private
    
    def self.valid_zipcode?(zipcode)
      zipcode.match(/\d{8}/)
    end
    
    def self.params(zipcode)
      {  Metodo: 'listaLogradouro',
         TipoConsulta: 'cep',
         StartRow: 1,
         EndRow: 10,
         CEP: zipcode
      }
    end
  end
end