require 'spec_helper'

describe ChangeCoordinates do
  describe '#run' do
    subject { described_class }
    let!(:file_or_data) do
      '5 5
      1 2 N
      LMLMLMLMM
      3 3 E
      MMRMMRMRRM'
    end
    let!(:result) do
      [[1, 3, "N"], [5, 1, "E"]]
    end

    context 'when data initialize script and' do
      it 'return results' do
        expect(subject.new(file_or_data).run).to match_array(result)
      end
    end

    context 'when csv initialize script and' do
      before do
        allow(File).to receive(:open).and_return(true)
        allow(File).to receive(:read).and_return(file_or_data)
      end

      it 'return results' do
        expect(subject.new(file_or_data).run).to match_array(result)
      end
    end

    context 'when space probe exceds the limit of upland' do
      let!(:data) do
        '5 5
        5 5 N
        LMLMLMLMM'
      end

      it 'fail and return false' do
        expect(subject.new(data).run).to eq(ChangeCoordinates::INVALID_FINAL_POSITION)
      end
    end

    context 'when the input data is invalid' do
      let!(:data) { 'X' }

      it 'fail and return false' do
        expect(subject.new(data).run).to eq(ChangeCoordinates::INVALID_PARAMS)
      end
    end

    context 'when the input file is invalid' do
      let!(:data) { 'X' }

      before do
        allow(File).to receive(:open).and_return(true)
        allow(File).to receive(:read).and_return(data)
      end

      it 'fail and return false' do
        expect(subject.new(data).run).to eq(ChangeCoordinates::INVALID_PARAMS)
      end
    end
  end
end
