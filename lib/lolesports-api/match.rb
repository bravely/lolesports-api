module LolesportsApi
  class Match < LolesportsApi::BaseApiObject
    attr_reader :id, :blue_team, :red_team, :date_time, :games,
                :is_finished, :is_live, :live_streams,
                :max_games, :name, :polldaddy_id, :url,
                :winner_id

    attr_accessor :tournament

    API_URL = 'http://na.lolesports.com/api/match'

    def initialize(attributes = {})
      @id = (attributes['id'] || attributes['matchId']).to_i
      @date_time =
        DateTime.parse(attributes['dateTime']) if attributes['dateTime']
      @is_finished = attributes['isFinished']
      @is_live = attributes['isLive']
      @live_streams = attributes['liveStreams']
      @max_games = attributes['maxGames']
      @name = attributes['name']
      @polldaddy_id = attributes['polldaddyId']
      @tournament = LolesportsApi::Tournament.new(attributes['tournament'])
      @url = attributes['url']
      @winner_id = attributes['winnerId']

      prepare_teams(attributes)
      prepare_games(attributes)

      self
    end

    def self.find(match_id)
      super
      @base_object.prepare_games(@attributes)
      @base_object
    end

    def prepare_games(attrs)
      return unless attrs['games']
      @games = []
      attrs['games'].each_value do |game|
        @games << LolesportsApi::Game.new(game)
      end
    end

    def prepare_teams(attrs)
      return unless attrs['contestants']
      @blue_team = LolesportsApi::Team.new(attrs['contestants']['blue'])
      @red_team = LolesportsApi::Team.new(attrs['contestants']['red'])
    end
  end
end
