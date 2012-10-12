# encoding: UTF-8
require 'spec_helper'

describe Correios::Parser do
  let(:uri) { 'http://www.buscacep.correios.com.br/servicos/dnec/consultaLogradouroAction.do' }
  subject { described_class.new body }  
  
  describe '#parse' do
    context 'when zipcode found' do
      let(:body) { File.read 'spec/support/zipcode_found.html' }
      
      before :all do
        stub_request(:get, uri).to_return(:status => 200, :body => body, :headers => {})
      end
      
      it 'returns zipcode corresponding address' do
        address = subject.parse
        address[:street].should == 'Avenida Moema - até 349/350'
        address[:district].should == 'Moema'
        address[:city].should == 'São Paulo'
        address[:state].should == 'SP'
        address[:zipcode].should == '04077-020'
      end
    end
    
    context 'when zipcode not found' do
      let(:body) { 'CEP NAO ENCONTRADO' }
      
      before :all do
        stub_request(:get, uri).to_return(:status => 200, :body => body, :headers => {})
      end
      
      it 'raises zipcode not found error' do
        expect { subject.parse }.to raise_error(Correios::Parser::ZipcodeNotFound)
      end
    end
  end
end