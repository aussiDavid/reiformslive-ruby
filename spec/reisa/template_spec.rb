require "spec_helper"

describe Reisa::Template do
  subject { described_class.new }
  
  it "can get all templates" do
    expect(described_class).to respond_to(:all)
  end

  it "can get a template" do
    expect(described_class).to respond_to(:find)
  end
  
  describe 'static methods' do
    before(:each) do
      expect(Reisa::Session).to receive(:get).with(path: 'templates').and_return('[{"id": 1},{"id": 2}]')
    end

    describe 'all' do
      subject { described_class.all }
      

      it "returns a list" do
        expect(subject).to respond_to(:each)
      end

      it "templates to be of type temlpate" do
        expect(subject.first).to be_a described_class
      end
    end


    describe 'find' do
      subject { described_class.find 2 }

      it "returns a template" do
        expect(subject).to be_a described_class
      end

      it "finds the correct template" do
        expect(subject.id).to eq 2
      end
    end
  end

  describe 'initialistion' do
    subject { described_class.new data: '{"key": "value"}' }
  
    it 'can be iniailised with json' do
      expect{ subject }.not_to raise_exception
    end

    it 'can be iniailised with json' do
      expect(subject.data).to eq({'key' => 'value'})
    end
  end

  subject { 
    described_class.new(
      data: '{
        "cost": "1256",
        "active": true,
        "id": "20",
        "name": "Example Template",
        "code": "ET01",
        "template_group_id": "2"
      }'
    ) 
  }
  
  it 'has a cost in cents' do
    expect(subject.cost).to eq 1256
  end
  
  it 'has an active status' do
    expect(subject.active).to eq true
  end
  
  it 'has an id' do
    expect(subject.id).to eq 20
  end

  it 'has a name' do
    expect(subject.name).to eq 'Example Template'
  end

  it 'has a code' do
    expect(subject.code).to eq 'ET01'
  end

  it 'has a template group id' do
    expect(subject.template_group_id).to eq 2
  end

  describe 'use case' do
  end
end
