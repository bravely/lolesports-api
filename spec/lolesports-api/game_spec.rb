describe LolesportsApi::Game do
  describe '.find', vcr: true do
    context 'when a game has vods' do
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
      it 'has the proper youtube_url' do
        expect(game.youtube_url).to eq 'http://www.youtube.com/watch?v=_bsRoa3u0t8'
      end
    end
    context 'when a game does not have vods' do
      let(:game) { LolesportsApi::Game.find(5334) }
      it { expect(game.youtube_url).to eq nil }
    end
    context 'when a game is in the future' do
      let(:game) do
        VCR.use_cassette('game/future') do
          LolesportsApi::Game.find(7071)
        end
      end
      it { expect(game.id).to eq 7071 }
      it { expect(game.winner_id).to eq nil }
    end
  end
end
