describe LolesportsApi::Tournament do
  describe '.find', vcr: true do
    let(:tournament) { LolesportsApi::Tournament.find(102) }
    it { expect(tournament.class).to eq LolesportsApi::Tournament }
    it { expect(tournament.name).to eq 'EU LCS Summer Split' }
    it { expect(tournament.id).to eq 102 }
    it { expect(tournament.contestants[0].id).to eq 1100 }
  end
end
