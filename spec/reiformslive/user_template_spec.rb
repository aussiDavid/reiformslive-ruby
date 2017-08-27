require "spec_helper"

describe REIformslive::UserTemplate do
  subject { described_class.new }
  
  it "can get all templates" do
    expect(described_class).to respond_to(:all)
  end

  it "can get a template" do
    expect(described_class).to respond_to(:find)
  end
  
  describe 'static methods', :vcr do

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
      before(:each) do
        expect(REIformslive::Session).to receive(:get).and_return('{"id": 2}')
      end
      
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
    subject { described_class.new data: {'key' => 'value'} }
  
    it 'can be iniailised with json' do
      expect{ subject }.not_to raise_exception
    end

    it 'can be iniailised with json' do
      expect(subject.data).to eq({'key' => 'value'})
    end
  end

  subject { 
    described_class.new(
      data: {
        'id'                  => '20',
        'template_version_id' => '25',
        'agency_id'           => '9',
        'user_id'             => '7',
        'name'                => 'Example Template',
        'template'            => 'true',
        'finalised'           => 'true',
        'private'             => 'true',
        'created'             => '1348728696',
        'updated'             => '1349143614',
        'given_name'          => 'John',
        'surname'             => 'Smith',
        'template_cost'       => '1287',
        'template_id'         => '2',
        'template_name'       => 'Template',
        'template_code'       => 'T01',
      }
    ) 
  }
  
  it 'has an id' do
    expect(subject.id).to eq 20
  end
  
  it 'has a template version id' do
    expect(subject.template_version_id).to eq 25
  end

  it 'has an agency id' do
    expect(subject.agency_id).to eq 9
  end

  it 'has a user id' do
    expect(subject.user_id).to eq 7
  end

  it 'has a name' do
    expect(subject.name).to eq 'Example Template'
  end
  
  it 'has a boolean if user template is a template' do
    expect(subject.template?).to be true
  end

  it 'has a boolean if user template is a template' do
    expect(subject.template?).to be true
  end

  it 'has a boolean if user template is finalised' do
    expect(subject.finalised?).to be true
  end

  it 'has a boolean if user template is private' do
    expect(subject.private?).to be true
  end

  it 'has a created at timestamp' do
    expect(subject.created_at).to eq Time.at(1348728696) 
  end

  it 'has a updated at timestamp' do
    expect(subject.updated_at).to eq Time.at(1349143614) 
  end

  it 'has a first name for the transaction editor' do
    expect(subject.given_name).to eq 'John'
  end

  it 'has a surname for the transaction editor' do
    expect(subject.surname).to eq 'Smith'
  end

  it 'can generate the full name' do
    expect(subject.full_name).to eq 'John Smith'
  end

  it 'has a cost' do
    expect(subject.template_cost).to eq 1287
  end

  it 'has a user template id' do
    expect(subject.template_id).to eq 2
  end

  it 'has the name of the original template' do
    expect(subject.original_template_name).to eq 'Template'
  end
  
  it 'has the code of the original template' do
    expect(subject.original_template_code).to eq 'T01'
  end
end
