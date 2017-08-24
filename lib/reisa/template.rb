module Reisa
  class Template
    PATH = 'templates'.freeze

    attr_reader :data, :path
    
    def initialize data: '{}'
      @data = data.parse_json
      
    end

    def cost
      data['cost'].to_i
    end

    def active
      data['active']
    end

    def id
      data['id'].to_i
    end

    def name
      data['name']
    end

    def code
      data['code']
    end

    def template_group_id
      data['template_group_id'].to_i
    end

    def self.all
      Reisa::Session
        .get(path: PATH)
        .parse_json
        .map{|data| data.to_s.gsub '=>', ':' }
        .map{|data| Template.new data: data }
    end

    def self.find id
      all
        .select{|template| template.id == id }
        .first
    end
  end
end
