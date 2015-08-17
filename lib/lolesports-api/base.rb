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
      self.class.fail_by_status(response) unless response.success?
      @attributes = JSON.parse(response.body)
      @attributes['id'] = @id
      initialize(@attributes)
      self
    end

    def self.fail_by_status(response)
      klass =
        LolesportsApi::Error::ERRORS[response.status] || LolesportsApi::Error
      fail klass
    end

    private

    def parse_datetime(attribute)
      DateTime.parse(attribute) if attribute
    end
  end
end
