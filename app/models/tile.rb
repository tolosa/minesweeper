class Tile

  attr_reader :row, :column, :revealed
  attr_accessor :mine

  def initialize(row, column, board)
    @row, @column, @board = row, column, board
    @revealed = @mine = false
    @neighbor_mines = 0
  end

  def reveal!
    @revealed = true
  end

  def get_neighbors
    @board.tiles.flatten.select do |t|
      (t.row <= row + 1 && t.row >= row - 1) &&
      (t.column <= column + 1 && t.column >= column - 1) &&
      t != self
    end
  end

  def neighbor_mines_count
    get_neighbors.select { |t| t.mine }.size
  end

end
