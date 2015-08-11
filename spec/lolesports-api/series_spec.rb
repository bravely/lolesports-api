describe LolesportsApi::Series do
  describe '.find', vcr: true do
    let(:series) { LolesportsApi::Series.find(20) }
    it { expect(series.class).to eq LolesportsApi::Series }
    it { expect(series.label).to eq 'NA LCS Expansion' }
    it { expect(series.id).to eq 20 }
    it { expect(series.tournaments[0].id).to eq 181 }
  end
end
