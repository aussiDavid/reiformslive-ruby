require "spec_helper"

describe REIformslive::Form do
  subject { described_class.new }
  
  it 'can get all forms' do
    expect(described_class).to respond_to(:all)
  end

  it 'can get a form' do
    expect(described_class).to respond_to(:find)
  end
  
  describe 'static methods', :vcr do

    describe 'all' do
      subject { described_class.all }
      
      it 'returns a list' do
        expect(subject).to respond_to(:each)
      end

      it 'forms to be of type form' do
        expect(subject.first).to be_a described_class
      end
    end

    describe 'find' do
      before(:each) do
        expect(REIformslive::Session).to receive(:get).and_return('{"id": 2}')
      end
      
      subject { described_class.find 2 }

      it 'returns a form' do
        expect(subject).to be_a described_class
      end

      it 'finds the correct form' do
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
        'id'                          => '1',
        'template_version_id'         => '1',
        'agency_id'                   => '1',
        'user_id'                     => '1',
        'name'                        => 'Important form',
        'template'                    => 'false',
        'finalised'                   => 'true',
        'private'                     => 'false',
        'created'                     => '1350966273',
        'updated'                     => '1350966303',
        'given_name'                  => 'John',
        'surname'                     => 'Doe',
        'template_cost'               => '80',
        'template_id'                 => '144',
        'template_name'               => 'Agency Template',
        'template_code'               => 'T1000',
        'template_instruction_pages'  => '1',
      }
    ) 
  }
  
  it 'has id' do
    expect(subject.id).to eq 1
  end

  it 'has template_version_id' do
    expect(subject.template_version_id).to eq 1
  end

  it 'has agency_id' do
    expect(subject.agency_id).to eq 1
  end

  it 'has user_id' do
    expect(subject.user_id).to eq 1
  end

  it 'has name' do
    expect(subject.name).to eq 'Important form'
  end

  it 'has template' do
    expect(subject.template?).to be false
  end

  it 'has finalised' do
    expect(subject.finalised?).to be true
  end

  it 'has private' do
    expect(subject.private?).to be false
  end

  it 'has created_at' do
    expect(subject.created_at).to eq Time.at(1350966273)
  end

  it 'has updated_at' do
    expect(subject.updated_at).to eq Time.at(1350966303)
  end

  it 'has given_name' do
    expect(subject.given_name).to eq 'John'
  end

  it 'has surname' do
    expect(subject.surname).to eq 'Doe'
  end

  it 'has full_name' do
    expect(subject.full_name).to eq 'John Doe'
  end

  it 'has template_cost' do
    expect(subject.template_cost).to eq 80
  end

  it 'has template_id' do
    expect(subject.template_id).to eq 144
  end

  it 'has template_name' do
    expect(subject.template_name).to eq 'Agency Template'
  end

  it 'has template_code' do
    expect(subject.template_code).to eq 'T1000'
  end

  it 'has template_instruction_pages' do
    expect(subject.template_instruction_pages).to eq 1
  end

  it 'can update' do
    expect(REIformslive::Session).to receive(:put).and_return('{"message": "The form has been saved."}')
    expect(REIformslive::Session).to receive(:get).and_return('{"template_code": "ABC123"}')

    subject.update 'template_code' => 'ABC123'

    expect(subject.template_code).to eq 'ABC123'
  end
end
