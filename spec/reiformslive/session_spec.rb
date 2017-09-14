require "spec_helper"

describe REIformslive::Session do
  subject { described_class.new }

  it 'can get a token' do
    expect(subject).to respond_to :token
  end

  describe 'token' do
    subject { described_class.new.token }

    it 'has a valid token' do
     VCR.use_cassette :session do
        expect(subject).to match /\d{8}\-\d{4}\-\d{4}\-\d{4}\-\d{12}/
      end
    end

    it 'makes a request' do
      stub = stub_request(:post, 'https://sa-api.staging.reiformslive.com.au/session')
        .to_return(body: '{"token": "0000"}')
      subject
      expect(stub).to have_been_requested    
    end
  end
end
