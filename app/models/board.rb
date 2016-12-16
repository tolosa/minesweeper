class Board

  attr_reader :rows, :columns, :tiles, :mines_count, :moves_count, :lost

  def initialize(rows, columns, mines_count)
    @rows, @columns, @mines_count = rows, columns, mines_count
    reset!
  end

  def reset!
    @lost = false
    @moves_count = 0
    initialize_tiles
    populate_mines
  end

  def reveal(row, column)
    return if lost
    @moves_count = @moves_count + 1
    get_tile(row, column).tap do |tile|
      @lost = true if tile.mine
      tile.reveal!
    end
  end

  def get_tile(row, column)
    @tiles[column][row]
  end

private

  def initialize_tiles
    @tiles = Array.new(@columns) { |column| Array.new(@rows) { |row| Tile.new(row, column, self) } }
  end

  def populate_mines
    @mines_count.times do |i|
      get_tile(rand(@columns), rand(@rows)).mine = true
    end
  end

end
