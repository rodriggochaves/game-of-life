require 'game_of_life/cell'

RSpec.describe GameOfLife::Cell do
  it 'is created dead' do
    cell = described_class.new
    expect(cell.status).to eq(GameOfLife::Cell::DEAD)
  end

  it 'can be revived' do
    cell = described_class.new
    cell.revive
    expect(cell.status).to eq(GameOfLife::Cell::ALIVE)
  end

end
