describe LolesportsApi::Error do
  describe '#new' do
    let(:error) { LolesportsApi::Error.new('Unauthorized Access', 403) }
    it { expect(error.message).to eq 'Unauthorized Access' }
    it { expect(error.code).to eq 403 }
  end
end
