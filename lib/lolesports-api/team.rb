require 'faraday'
require 'json'

module LolesportsApi
  class Team < LolesportsApi::BaseApiObject
    attr_reader :id, :acronym, :bio, :logo_url, :name,
                :no_players, :profile_url, :roster,
                :team_photo_url

    API_URL = 'http://na.lolesports.com/api/team'

    def initialize(attributes)
      @id = attributes['id']
      @acronym = attributes['acronym']
      @bio = attributes['bio']
      @logo_url = attributes['logoUrl']
      @name = attributes['name']
      @no_players = attributes['noPlayers']
      @profile_url = attributes['profileUrl']
      @roster = []
      @team_photo_url = attributes['teamPhotoUrl']
    end

    def self.find(team_id)
      super
      @attributes['roster'].values.each do |player|
        @base_object.roster << LolesportsApi::Player.new(player)
      end
      @base_object
    end
  end
end
