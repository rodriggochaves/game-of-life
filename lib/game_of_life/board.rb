require 'game_of_life/cell'

module GameOfLife
  class Board
    attr_reader :cells
  
    def initialize cell_quantity
      set_board_limit(cell_quantity)

      cells = (0..cell_quantity - 1).to_a.map do |x|
        (0..cell_quantity - 1).to_a.map do |y|
          Cell.new(x, y)
        end
      end

      @cells = cells.flatten
    end

    def get_cell x, y
      @cells.find { |cell| cell.x == x && cell.y == y }
    end

    def decide_cell_status cell
      case count_neighbors(cell)
      when 0..1
        GameOfLife::Cell::DEAD
      when 2..3
        GameOfLife::Cell::ALIVE
      when 4..8
        GameOfLife::Cell::DEAD
      end
    end

    def next_generation_status 
      next_status_map = @cells.map do |cell|
        {
          x: cell.x,
          y: cell.y,
          next: decide_cell_status(cell)
        }
      end
    end

    def next_generation
      next_generation_status.map do |status|
        get_cell(status[:x], status[:y]).set(status[:next])
      end
    end

    def neighbors
      [
        { x: - 1, y: - 1 },
        { x: + 0, y: - 1 },
        { x: + 1, y: - 1 },
        { x: - 1, y: + 0 },
        { x: + 1, y: + 0 },
        { x: - 1, y: + 1 },
        { x: + 0, y: + 1 },
        { x: + 1, y: + 1 },
      ]
    end

    def count_neighbors cell
      neighbors
      .map { |position| { x: position[:x] + cell.x, y: position[:y] + cell.y } }
      .reject { |position| invalid_position?(position) }
      .map { |position| get_cell(position[:x], position[:y]).status }
      .sum
    end

    def invalid_position? position
      position[:x] < 0 || position[:x] > @board_limit || position[:y] < 0 || position[:y] > @board_limit
    end

    private def set_board_limit cell_quantity
      @board_limit = cell_quantity - 1
    end
  end
end
