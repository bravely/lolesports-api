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
    it { expect(match.tournament.id).to eq 102 }
    it { expect(match.tournament.name).to eq 'EU LCS Summer Split' }
    it { expect(match.winner_id).to eq 67 }
    it { expect(match.is_finished).to eq true }
  end
end
