describe LolesportsApi::Match do
  describe '.find', vcr: true do
    let(:match) { LolesportsApi::Match.find(2299) }
    it { expect(match.class).to eq LolesportsApi::Match }
    it { expect(match.name).to eq 'SK Gaming vs Copenhagen Wolves' }
    it { expect(match.id).to eq 2299 }
    it { expect(match.blue_team.acronym).to eq 'SK' }
    it { expect(match.red_team.id).to eq 1100 }
    it { expect(match.date_time.class).to eq DateTime }
    it { expect(match.games[0].id).to eq 2782 }
  end
end
