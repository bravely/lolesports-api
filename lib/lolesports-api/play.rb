module LolesportsApi
  class Play
    attr_reader :assists, :champion_id, :deaths, :end_level,
                :player_id, :items, :kda, :kills, :minions_killed,
                :name, :photo_url, :spell0, :spell1, :team_id,
                :total_gold, :player

    def initialize(attributes = {})
      @assists = attributes['assists']
      @champion_id = attributes['championId']
      @deaths = attributes['deaths']
      @end_level = attributes['endLevel']
      @player_id = attributes['id']
      @items = processed_items(attributes)
      @kda = attributes['kda']
      @kills = attributes['kills']
      @minions_killed = attributes['minionsKilled']
      @name = attributes['name']
      @photo_url = attributes['photoURL']
      @spell0 = attributes['spell0'].to_i
      @spell1 = attributes['spell1'].to_i
      @team_id = attributes['teamId']
      @total_gold = attributes['totalGold']

      @player = prepare_player
    end

    private

    def processed_items(attrs)
      collected_items = []
      attrs.each do |key, value|
        collected_items << value.to_i if key.match(/^items\d$/)
      end
      collected_items
    end

    def prepare_player
      LolesportsApi::Player.new(
        'id' => @player_id,
        'name' => @name,
        'photoUrl' => @photo_url,
        'teamId' => @team_id
      )
    end
  end
end
