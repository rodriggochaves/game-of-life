module GameOfLife
  class Cell
    DEAD = 0
    ALIVE = 1
    attr_reader :status, :x, :y

    def initialize(x, y)
      @x = x
      @y = y
      @status = DEAD
    end

    def set status
      @status = status
    end

    def kill
      @status = DEAD
    end

    def revive
      @status = ALIVE
    end
  end
end
