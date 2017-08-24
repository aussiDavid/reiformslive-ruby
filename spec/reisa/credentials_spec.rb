require "spec_helper"

describe Reisa::Credentials do
  subject { described_class.new }
  
  it "can access username" do
    expect(subject).to respond_to(:username)
  end

  it "can access password" do
    expect(subject).to respond_to(:password)
  end
end
