describe LolesportsApi::Team do
  describe '.find', vcr: true do
    let(:team) { LolesportsApi::Team.find(304) }
    it { expect(team.class).to eq LolesportsApi::Team }
    it { expect(team.acronym).to eq 'C9' }
    it { expect(team.id).to eq 304 }
    it { expect(team.roster.class).to eq Array }
    it { expect(team.roster.first.class).to eq LolesportsApi::Player }
    it { expect(team.roster[4].name).to eq 'Meteos' }
    it { expect(team.roster[4].id).to eq 329 }
  end
end