module REIformslive
  class Form
    PATH = '/forms'.freeze

    attr_reader :data
    
    def initialize data: {}
      @data = data
    end
   
    def id
      data['id'].to_i
    end
   
    def template_version_id
      data['template_version_id'].to_i
    end

    def agency_id
      data['agency_id'].to_i
    end

    def user_id
      data['user_id'].to_i
    end

    def name
      data['name']
    end

    def template?
      data['template'].to_s == 'true'
    end

    def finalised?
      data['finalised'].to_s == 'true'
    end

    def private?
      data['private'].to_s == 'true'
    end

    def created_at
      Time.at data['created'].to_i
    end

    def updated_at
      Time.at data['updated'].to_i
    end

    def given_name
      data['given_name']
    end

    def surname
      data['surname']
    end

    def full_name
      "#{given_name} #{surname}"
    end

    def template_cost
      data['template_cost'].to_i
    end

    def template_id
      data['template_id'].to_i
    end

    def template_name
      data['template_name']
    end

    def template_code
      data['template_code']
    end

    def template_instruction_pages
      data['template_instruction_pages'].to_i
    end

    def update data={}, path: "#{PATH}/#{id}/save"
      REIformslive::Session
        .put(path: path, data: data)
        .parse_json['message']
        .send(:==, 'The form has been saved.')
        .tap{|ok| @data = self.class.find(id).data if ok }
    end

    def self.all path: PATH
      REIformslive::Session
        .get(path: path)
        .parse_json
        .map{|data| self.new data: data }
    end

    def self.find id, path: "#{PATH}/#{id}"
      self.new data:
        REIformslive::Session
          .get(path: path)
          .parse_json
    end
  end
end
