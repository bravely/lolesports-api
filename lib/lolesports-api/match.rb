module LolesportsApi
  class Match < LolesportsApi::BaseApiObject
    attr_reader :id, :blue_team, :red_team, :date_time, :games,
                :is_finished, :is_live, :live_streams,
                :max_games, :name, :polldaddy_id, :url,
                :winner_id

    attr_accessor :tournament

    API_URL = 'http://na.lolesports.com/api/match'

    def initialize(attributes = {})
      @id = attributes['id'] || attributes['matchId']
      @blue_team =
        LolesportsApi::Team.new(attributes['contestants']['blue'])
      @red_team =
        LolesportsApi::Team.new(attributes['contestants']['red'])
      @date_time =
        DateTime.parse(attributes['dateTime']) if attributes['dateTime']
      @games = []
      @is_finished = attributes['isFinished']
      @is_live = attributes['isLive']
      @live_streams = attributes['liveStreams']
      @max_games = attributes['maxGames']
      @name = attributes['name']
      @polldaddy_id = attributes['polldaddyId']
      @tournament = LolesportsApi::Tournament.new(attributes['tournament'])
      @url = attributes['url']
      @winner_id = attributes['winnerId']
    end

    def self.find(match_id)
      super
      @attributes['games'].each_value do |game|
        @base_object.games << LolesportsApi::Game.new(game)
      end
      @base_object
    end
  end
end
