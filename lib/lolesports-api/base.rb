require 'faraday'
require 'json'
require 'date'

module LolesportsApi
  class BaseApiObject
    SCHEDULE_URL = 'http://na.lolesports.com/api/schedule.json'

    def self.find(base_id)
      response = Faraday.get("#{self::API_URL}/#{base_id}.json")
      fail_by_status(response) unless response.success?
      @attributes = JSON.parse(response.body)
      @attributes['id'] = base_id
      @base_object = new(@attributes)
    end

    def reload
      response = Faraday.get("#{self.class::API_URL}/#{@id}.json")
      fail_by_status(response) unless response.success?
      @attributes = JSON.parse(response.body)
      initialize(@attributes)
      self
    end

    private

    def fail_by_status(response)
      klass =
        LolesportsApi::Error::ERRORS[response.code] || LolesportsApi::Error
      fail klass
    end
  end
end
