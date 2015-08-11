module LolesportsApi
  class Series < LolesportsApi::BaseApiObject
    attr_reader :id, :label, :label_public, :season,
                :tournaments, :url

    API_URL = 'http://na.lolesports.com/api/series'

    def initialize(attributes)
      @id = attributes['id']
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
  end
end
