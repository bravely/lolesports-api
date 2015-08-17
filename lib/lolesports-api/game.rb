module LolesportsApi
  class Game < LolesportsApi::BaseApiObject
    attr_reader :id, :date_time, :game_length, :game_number,
                :legs_url, :match_id, :max_games, :no_vods,
                :platform_game_id, :platform_id, :players,
                :tournament, :vods, :winner_id, :has_vod

    attr_accessor :blue_team, :red_team

    API_URL = 'http://na.lolesports.com/api/game'

    def initialize(attributes = {})
      @id = attributes['id'].to_i
      @game_length = attributes['gameLength'].to_i
      @game_number = attributes['gameNumber'].to_i
      @legs_url = attributes['legsUrl']
      @match_id = attributes['matchId'].to_i
      @max_games = attributes['maxGames'].to_i
      @no_vods = attributes['noVods']
      @platform_game_id = attributes['platformGameId']
      @platform_id = attributes['platformId']
      @players = []
      @tournament = attributes['tournament'] || {}
      @vods = attributes['vods'] || {}
      @winner_id = attributes['winnerId'].to_i
      @has_vod = attributes['hasVod']
      @date_time = parse_datetime(attributes['dateTime'])

      prepare_teams(attributes)

      self
    end

    def self.find(game_id)
      super
      @attributes['players'].each_value do |player|
        @base_object.players << LolesportsApi::Play.new(player)
      end
      @base_object.prepare_teams(@attributes)
      @base_object
    end

    def prepare_teams(attrs)
      return unless attrs['contestants']
      @blue_team = LolesportsApi::Team.new(attrs['contestants']['blue'])
      @red_team = LolesportsApi::Team.new(attrs['contestants']['red'])
    end
  end
end
