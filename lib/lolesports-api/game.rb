require 'faraday'
require 'json'

module LolesportsApi
  class Game < LolesportsApi::BaseApiObject
    attr_reader :id, :date_time, :game_length, :game_number,
                :legs_url, :match_id, :max_games, :no_vods,
                :platform_game_id, :platform_id, :players,
                :tournament, :vods, :winner_id

    attr_accessor :blue_team, :red_team

    API_URL = 'http://na.lolesports.com/api/game'

    def initialize(attributes = {})
      @id = attributes['id']
      @blue_team = LolesportsApi::Team.new
      @red_team = LolesportsApi::Team.new
      @date_time = attributes['dateTime']
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
    end

    def self.find(game_id)
      super
      @attributes['players'].each_value do |player|
        @base_object.players << LolesportsApi::Play.new(player)
      end
      @base_object.blue_team = LolesportsApi::Team.new(
        @attributes['contestants']['blue'])
      @base_object.red_team = LolesportsApi::Team.new(
        @attributes['contestants']['red'])
      @base_object
    end
  end
end
