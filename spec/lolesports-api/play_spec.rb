describe LolesportsApi::Play do
  describe '#initialize' do
    let(:attributes) do
      {
        'assists' => 2,
        'championId' => 117,
        'deaths' => 5,
        'endLevel' => 11,
        'id' => 1101,
        'items0' => '1056',
        'items1' => '3028',
        'items2' => '1056',
        'items3' => '3108',
        'items4' => '3020',
        'items5' => '1056',
        'kda' => 0.4,
        'kills' => 0,
        'minionsKilled' => 124,
        'name' => 'YoungBuck',
        'photoURL' => 'http://riot-web-cdn.s3-us-west-1.amazonaws.com/lolesports/s3fs-public/CW-youngbuck-2015.jpg',
        'spell0' => '4',
        'spell1' => '12',
        'teamId' => 1100,
        'totalGold' => 5788
      }
    end
    let(:play) { LolesportsApi::Play.new(attributes) }
    it { expect(play.player_id).to eq 1101 }
    it { expect(play.items).to eq [1056, 3028, 1056, 3108, 3020, 1056] }
    it { expect([play.spell0, play.spell1]).to eq [4, 12] }
    it { expect(play.player.class).to eq LolesportsApi::Player }
  end
end
