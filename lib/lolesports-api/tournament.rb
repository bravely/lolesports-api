module LolesportsApi
  class Tournament < LolesportsApi::BaseApiObject
    attr_reader :id, :contestants, :date_begin, :date_end,
                :is_finished, :name, :name_public, :no_vods,
                :published, :season, :winner, :round, :matches

    API_URL = 'http://na.lolesports.com/api/tournament'

    def initialize(attributes)
      @id = attributes['id'].to_i
      @contestants = []
      @date_begin =
        Date.parse(attributes['dateBegin']) if attributes['dateBegin']
      @date_end =
        Date.parse(attributes['dateEnd']) if attributes['dateEnd']
      @is_finished = attributes['isFinished']
      @name = attributes['name']
      @name_public = attributes['namePublic']
      @no_vods = attributes['noVods']
      @published = attributes['published']
      @season = attributes['season'].to_i
      @winner = attributes['winner'].to_i
      @round = attributes['round']
      @matches = []

      self
    end

    def self.find(tournament_id)
      super
      @attributes['contestants'].each_value do |contestant|
        @base_object.contestants << LolesportsApi::Team.new(contestant)
      end
      @base_object
    end

    def find_matches
      response = Faraday.get("#{SCHEDULE_URL}?tournamentId=#{@id}")
      matches_json = JSON.parse(response.body)
      matches_json.each_value do |match|
        @matches << LolesportsApi::Match.new(match)
      end
      @matches
    end
  end
end