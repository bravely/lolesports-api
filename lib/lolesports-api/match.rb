module LolesportsApi
  class Match < LolesportsApi::BaseApiObject
    attr_reader :id, :blue_team, :red_team, :date_time, :games,
                :is_finished, :is_live, :live_streams,
                :max_games, :name, :polldaddy_id, :url,
                :winner_id, :round

    attr_accessor :tournament

    API_URL = 'http://na.lolesports.com/api/match'

    def initialize(attributes = {})
      @id = (attributes['id'] || attributes['matchId']).to_i
      @date_time = parse_datetime(attributes['dateTime'])
      @is_finished = (attributes['isFinished'] == '1' ? true : false)
      @is_live = attributes['isLive']
      @live_streams = attributes['liveStreams']
      @max_games = attributes['maxGames']
      @name = attributes['name']
      @polldaddy_id = attributes['polldaddyId']
      @tournament = LolesportsApi::Tournament.new(attributes['tournament'])
      @url = attributes['url']
      @winner_id = attributes['winnerId'].to_i

      if attributes['tournament']
        @round = attributes['tournament']['round'].to_i
      end
      prepare_teams(attributes['contestants'])
      prepare_games(attributes)

      self
    end

    def self.find(match_id)
      super
      @base_object.prepare_games(@attributes)
      @base_object
    end

    def prepare_games(attrs)
      return unless attrs['games'] && attrs['games'].any?
      @games = []
      attrs['games'].each_value do |game|
        @games << LolesportsApi::Game.new(game)
      end
    end

    def prepare_teams(teams)
      return unless teams

      @blue_team = LolesportsApi::Team.new(teams['blue']) if teams['blue']
      @red_team = LolesportsApi::Team.new(teams['red']) if teams['red']
    end
  end
end
