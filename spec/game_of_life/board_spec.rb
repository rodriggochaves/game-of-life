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

  describe '#next_generation keeps alive cells with two neighbors' do
    before do
      board.get_cell(0,1).revive
      board.get_cell(1,1).revive
      board.get_cell(2,1).revive
      board.next_generation
    end

    it { expect(board.get_cell(0,1).status).to eq(GameOfLife::Cell::DEAD) }
    it { expect(board.get_cell(1,1).status).to eq(GameOfLife::Cell::ALIVE) }
  end

  it '#next_generation cell dies if has more than neighbors' do
    board.get_cell(0,0).revive
    board.get_cell(1,0).revive
    board.get_cell(2,1).revive
    board.get_cell(1,1).revive
    board.get_cell(0,1).revive
  
    expect { board.next_generation }.to change { board.get_cell(1,1).status }.to(GameOfLife::Cell::DEAD)  
  end

  it '#next_generation cell dies if is alone' do
    board.get_cell(0,0).revive
  
    expect { board.next_generation }.to change { board.get_cell(0,0).status }.to(GameOfLife::Cell::DEAD)  
  end

  it '#next_generation cell dies if has one neighbor' do
    board.get_cell(0,0).revive
    board.get_cell(0,1).revive
  
    expect { board.next_generation }.to change { board.get_cell(0,0).status }.to(GameOfLife::Cell::DEAD)  
  end
end
