require "spec_helper"

describe REIformslive::Session do
  it 'can perform a GET request' do
    expect(described_class).to respond_to :get
  end

  it 'can perform a PUT request' do
    expect(described_class).to respond_to :put
  end

  describe 'GET requst' do
    it 'performs the request' do
      stub = stub_request :get, 'https://sa-api.staging.reiformslive.com.au/'
      described_class.get
      expect(stub).to have_been_requested    
    end

    it 'performs the request to /templates' do
      stub = stub_request :get, 'https://sa-api.staging.reiformslive.com.au/templates'
      described_class.get path: '/templates'
      expect(stub).to have_been_requested    
    end
  end

  describe 'PUT requst' do
    it 'performs the request' do
      stub = stub_request :put, 'https://sa-api.staging.reiformslive.com.au/'
      described_class.put
      expect(stub).to have_been_requested    
    end

    it 'performs the request to /form' do
      stub = stub_request :put, 'https://sa-api.staging.reiformslive.com.au/form'
      described_class.put path: '/form'
      expect(stub).to have_been_requested    
    end
  end
end
