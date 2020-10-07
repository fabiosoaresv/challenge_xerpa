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
  end
end
