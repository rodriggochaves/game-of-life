require 'game_of_life/board'

RSpec.describe GameOfLife::Board do
  let(:board) { described_class.new(3) }

  describe 'can create a new square board with n x n cells' do
    it { expect(board.cells.count).to eq(9) }
  end

  it '#get_cell returns a based on x and y' do
    expect(board.get_cell(1,1).class).to eq(GameOfLife::Cell)
  end

  it '#count_neighbors' do
    board.get_cell(0,1).revive
    board.get_cell(1,1).revive
    board.get_cell(2,1).revive
    expect(board.count_neighbors(board.get_cell(1,1))).to eq(2)
  end

  it '#next_generation keeps alive cells with two neighbors' do
    board.get_cell(0,1).revive
    board.get_cell(1,1).revive
    board.get_cell(2,1).revive
    board.next_generation
    expect(board.get_cell(0,1).status).to eq(GameOfLife::Cell::DEAD)
    expect(board.get_cell(1,1).status).to eq(GameOfLife::Cell::ALIVE)
  end
end
