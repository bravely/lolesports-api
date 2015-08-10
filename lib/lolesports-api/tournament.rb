module LolesportsApi
  class Tournament < LolesportsApi::BaseApiObject
    attr_reader :id, :contestants, :date_begin, :date_end,
                :is_finished, :name, :name_public, :no_vods,
                :published, :season, :winner, :round

    API_URL = 'http://na.lolesports.com/api/tournament'

    def initialize(attributes)
      @id = attributes['id']
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
    end

    def self.find(tournament_id)
      super
      @attributes['contestants'].each_value do |contestant|
        @base_object.contestants << LolesportsApi::Team.new(contestant)
      end
      @base_object
    end
  end
end
