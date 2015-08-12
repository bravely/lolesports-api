describe LolesportsApi::Series do
  describe '.find', vcr: true do
    let(:series) { LolesportsApi::Series.find(20) }
    it { expect(series.class).to eq LolesportsApi::Series }
    it { expect(series.label).to eq 'NA LCS Expansion' }
    it { expect(series.id).to eq 20 }
    it { expect(series.tournaments[0].id).to eq 181 }
  end

  describe '.all', vcr: true do
    let(:series) { LolesportsApi::Series.all }
    it { expect(series.class).to eq Array }
    it { expect(series[0].class).to eq LolesportsApi::Series }
    it { expect(series[0].id).to eq 1 }
    it { expect(series[0].label).to eq 'World Championship' }
  end
end
