require 'faraday'
require 'json'
require 'date'

module LolesportsApi
  class BaseApiObject
    SCHEDULE_URL = 'http://na.lolesports.com/api/schedule.json'

    def self.find(base_id)
      response = Faraday.get("#{self::API_URL}/#{base_id}.json")
      @attributes = JSON.parse(response.body)
      @attributes['id'] = base_id
      @base_object = new(@attributes)
    end

    def reload
      response = Faraday.get("#{self.class::API_URL}/#{@id}.json")
      @attributes = JSON.parse(response.body)
      initialize(@attributes)
      self
    end
  end
end
