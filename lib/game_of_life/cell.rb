module GameOfLife
  class Cell
    DEAD = 0
    ALIVE = 1
    attr_reader :status

    def initialize
      @status = DEAD
    end

    def revive
      @status = ALIVE
    end
  end
end
