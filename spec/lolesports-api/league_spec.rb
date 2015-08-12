describe LolesportsApi::League do
  describe '.find', vcr: true do
    let(:league) { LolesportsApi::League.find(1) }
    it { expect(league.class).to eq LolesportsApi::League }
    it { expect(league.label).to eq 'NA LCS' }
    it { expect(league.id).to eq 1 }
    it { expect(league.tournaments[0].id).to eq 7 }
    it { expect(league.name).to eq 'NA LCS' }
    it { expect(league.series[0].id).to eq 20 }
    it { expect(league.tournaments).to eq league.league_tournaments }
    it { expect(league.series).to eq league.league_series }
  end

  describe '.all', vcr: true do
    let(:leagues) { LolesportsApi::League.all }
    it { expect(leagues.class).to eq Array }
    it { expect(leagues[0].class).to eq LolesportsApi::League }
    it { expect(leagues[0].id).to eq 1 }
  end
end
