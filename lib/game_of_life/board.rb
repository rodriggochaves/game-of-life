require 'game_of_life/cell'

module GameOfLife
  class Board
    attr_reader :cells

    def self.create_cell_line cell_quantity
      (1..cell_quantity).to_a.map { |n| Cell.new }
    end
  
    def initialize cell_quantity
      @cells = (1..cell_quantity).to_a.map { |n| Board.create_cell_line(cell_quantity) }
    end

    def get_cell x, y
      @cells[x][y]
    end
  end
end
