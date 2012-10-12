require 'spec_helper'

describe Correios::CEP do
  describe '.search' do
    let(:parser) { mock(:parser).as_null_object }
    let(:response) { mock(:response).as_null_object }
    
    before do
      stub_const('Correios::CEP::BUSCA_CEP_URL', 'url')
    end
    
    it 'creates parser based on web service response' do
      described_class.stub params: 'params', valid_zipcode?: true
      Correios::Request.should_receive(:post).with('url', 'params').and_return(response)
      Correios::Parser.should_receive(:new).with(response).and_return parser
      described_class.search 'zipcode'      
    end
    
    it 'rejects malformed zipcodes' do
      described_class.search('111').should == {error: 'Invalid zipcode format'}
    end
  end
end