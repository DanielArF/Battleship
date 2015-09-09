class Player
    attr_accessor :my_board
    attr_accessor :opponents_board

  def initialize
    @my_board = Grid.new
    @opponents_board = Grid.new
  end

  def place_ship(coord)
    @my_board.grid[coord] = "s" if @my_board.grid[coord] == "w"
  end

  def shoot_at(player,coord)
    oppboard = (player).my_board
    if oppboard.grid[coord] == 's'
      oppboard.grid[coord] = 'hit'
      @opponents_board.grid[coord] = 'hit'
    else
      oppboard.grid[coord] = 'miss'
      @opponents_board.grid[coord] = 'miss'
    end
  end

end
