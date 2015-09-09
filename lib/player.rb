class Player
    attr_accessor :my_board
    attr_accessor :opponents_board

  def initialize
    @my_board = Grid.new
    @opponents_board = Grid.new
  end

  def place_ship(coord)
    if @my_board.grid[coord] == "w"
       @my_board.grid[coord] = "s"
    else
      'cant do that.'
    end
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
