module Correios
  class Parser
    def initialize(content)
      @content = content
    end
    
    def parse
      @doc = Nokogiri::HTML @content
      raise Correios::Parser::ZipcodeNotFound, "Zipcode not found" unless zipcode_found?
      address_fields = [:street, :district, :city, :state, :zipcode]
      address_values =  @doc.xpath('//div/table[count(tr/td)=5]/tr[last()]/td').map &:text
      Hash[*address_fields.zip(address_values).flatten]
    end
    
    private
    
    def zipcode_found?
      @doc.search("[text()*='CEP NAO ENCONTRADO']").empty?
    end
  end
end

class Correios::Parser::ZipcodeNotFound < StandardError; end