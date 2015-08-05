require 'faraday'
require 'json'

module Api
  class Player < Api::BaseApiObject
    attr_reader :id, :name, :bio, :first_name, :last_name,
                :team_id, :role, :role_id, :is_starter,
                :hometown, :contract_expiration, :photo_url,
                :profile_url, :residency, :api_url

    API_URL = 'http://na.lolesports.com/api/player'

    def initialize(attributes)
      @id = attributes['id'] || attributes['playerId'].to_i
      @name = attributes['name']
      @bio = attributes['bio']
      @first_name = attributes['firstname']
      @last_name = attributes['lastname']
      @team_id = attributes['teamId']
      @role = attributes['role']
      @role_id = attributes['roleId']
      @is_starter = attributes['isStarter']
      @hometown = attributes['hometown']
      @contract_expiration = attributes['contractExpiration']
      @photo_url = attributes['photoUrl']
      @profile_url = attributes['profileUrl']
      @residency = attributes['residency']
    end

    def self.all
      fail StandardError, 'No API endpoint available.'
    end
  end
end
