describe LolesportsApi::Player do
  describe '.find', vcr: true do
    let(:player) { LolesportsApi::Player.find(330) }
    it { expect(player.class).to eq LolesportsApi::Player }
    it { expect(player.first_name).to eq 'Hai' }
    it { expect(player.id).to eq 330 }
  end

  describe '.all' do
    it 'raises an error that no endpoint is available' do
      expect do
        @players = LolesportsApi::Player.all
      end.to raise_exception StandardError
    end
  end

  describe '#reload', vcr: true do
    let(:player) { LolesportsApi::Player.new('playerId' => '329') }
    before(:each) do
      player.reload
    end
    it { expect(player.class).to eq LolesportsApi::Player }
    it { expect(player.first_name).to eq 'William' }
    it { expect(player.id).to eq 329 }
  end
end
