describe Api::Player do
  describe '.find', vcr: true do
    let(:player) { Api::Player.find(330) }
    it { expect(player.class).to eq Api::Player }
    it { expect(player.first_name).to eq 'Hai' }
    it { expect(player.id).to eq 330 }
  end

  describe '.all' do
    it 'raises an error that no endpoint is available' do
      expect do
        @players = Api::Player.all
      end.to raise_exception StandardError
    end
  end

  describe '#get', vcr: true, focus: true do
    let(:player) { Api::Player.new('playerId' => '329') }
    before(:each) do
      player.get
    end
    it { expect(player.class).to eq Api::Player }
    it { expect(player.first_name).to eq 'William' }
  end
end
