describe LolesportsApi::Game do
  describe '.find', vcr: true do
    let(:game) { LolesportsApi::Game.find(2782) }
    it { expect(game.class).to eq LolesportsApi::Game }
    it { expect(game.game_length).to eq 1414 }
    it { expect(game.id).to eq 2782 }
    it { expect(game.players.first.class).to eq LolesportsApi::Play }
    it { expect(game.players[4].total_gold).to eq 7975 }
    it { expect(game.players[4].player_id).to eq 79 }
    it { expect(game.blue_team.id).to eq 67 }
    it { expect(game.red_team.name).to eq 'Copenhagen Wolves' }
    it { expect(game.date_time).to eq DateTime.new(2014, 5, 21, 15) }
  end
end
