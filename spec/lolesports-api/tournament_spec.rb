describe LolesportsApi::Tournament do
  describe '.find', vcr: true do
    let(:tournament) { LolesportsApi::Tournament.find(102) }
    it { expect(tournament.class).to eq LolesportsApi::Tournament }
    it { expect(tournament.name).to eq 'EU LCS Summer Split' }
    it { expect(tournament.id).to eq 102 }
    it { expect(tournament.contestants[0].id).to eq 1100 }
  end

  describe '#find_matches', vcr: true do
    let(:tournament) do
      LolesportsApi::Tournament.new('id' => 241).tap(&:find_matches)
    end
    it { expect(tournament.matches[0].id).to eq 5334 }
    it { expect(tournament.matches[0].games[0].id).to eq 7067 }
  end
end
