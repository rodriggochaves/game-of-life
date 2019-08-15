require 'game_of_life/board'

RSpec.describe GameOfLife::Board do
  let(:board) { described_class.new(3) }

  describe 'can create a new square board with n x n cells' do
    it { expect(board.cells.count).to eq(3) }
    it { expect(board.cells[0].count).to eq(3) }
  end

  it '#get_cell returns a based on x and y' do
    expect(board.get_cell(1,1).class).to eq(GameOfLife::Cell)
  end
end
