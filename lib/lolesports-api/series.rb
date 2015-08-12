module LolesportsApi
  class Series < LolesportsApi::BaseApiObject
    attr_reader :id, :label, :label_public, :season,
                :tournaments, :url

    API_URL = 'http://na.lolesports.com/api/series'

    def initialize(attributes)
      @id = attributes['id'].to_i
      @label = attributes['label']
      @label_public = attributes['labelPublic']
      @season = attributes['season']
      @tournaments = []
      @url = attributes['url']
    end

    def self.find(series_id)
      super
      @attributes['tournaments'].each do |tournament|
        @base_object.tournaments <<
          LolesportsApi::Tournament.new('id' => tournament)
      end
      @base_object
    end

    def self.all
      response_json = JSON.parse Faraday.get("#{API_URL}.json").body
      all_series = []
      response_json.each do |series|
        all_series << new(series)
      end
      all_series
    end
  end
end
