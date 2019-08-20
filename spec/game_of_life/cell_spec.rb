require 'game_of_life/cell'

RSpec.describe GameOfLife::Cell do
  let(:cell) { described_class.new(1,1) }

  it 'is created dead' do
    expect(cell.status).to eq(GameOfLife::Cell::DEAD)
  end

  it '#revive' do
    expect { cell.revive }.to change { cell.status }.to(GameOfLife::Cell::ALIVE)
  end

  it '#kill' do
    cell.revive
    expect { cell.kill }.to change { cell.status }.to(GameOfLife::Cell::DEAD)
  end

end
