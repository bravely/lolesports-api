module LolesportsApi
  class League < LolesportsApi::BaseApiObject
    attr_reader :id, :color, :default_series_id,
                :default_tournament_id, :international_live_stream,
                :label, :league_image, :league_series,
                :league_tournaments, :menu_weight, :no_vods,
                :published, :short_name, :url

    API_URL = 'http://na.lolesports.com/api/league'

    def initialize(attributes)
      @id = attributes['id'].to_i
      @color = attributes['color']
      @default_series_id = attributes['defaultSeriesId'].to_i
      @default_tournament_id = attributes['defaultTournamentId'].to_i
      # International Live Stream is one giant clusterfuck, watch out.
      @international_live_stream = attributes['internationalLiveStream']
      @label = attributes['label']
      @league_image = attributes['leagueImage']
      @league_series = attributes['leagueSeries'] || []
      @league_tournaments = []
      @menu_weight = attributes['menuWeight']
      @no_vods = attributes['noVods']
      @published = attributes['published']
      @short_name = attributes['shortName']
      @url = attributes['url']
    end

    def self.find(league_id)
      super
      @attributes['leagueTournaments'].each do |tournament|
        @base_object.league_tournaments <<
          LolesportsApi::Tournament.new('id' => tournament)
      end
      @base_object
    end

    def name
      @label
    end

    def series
      @league_series
    end

    def tournaments
      @league_tournaments
    end
  end
end
