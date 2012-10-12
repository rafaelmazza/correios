require 'spec_helper'

describe Correios::Request do
  let(:uri) { 'http://www.buscacep.correios.com.br/servicos/dnec/consultaLogradouroAction.do' }
  
  describe '.post' do
    it 'posts uri with params' do
      stub_request :post, uri
      described_class.post uri, 'params'
      WebMock.should have_requested(:post, uri).with(body: 'params')      
    end
  end
end