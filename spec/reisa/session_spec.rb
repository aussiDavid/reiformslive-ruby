require "spec_helper"

describe Reisa::Session do
  it 'can perform a get request' do
    expect(described_class).to respond_to :get
  end

  describe 'get requst' do
    it 'performs the request'
  end
end
