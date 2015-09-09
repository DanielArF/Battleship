class Player
    attr_accessor :my_board, :opponents_board, :ships

  def initialize
    @my_board = Grid.new
    @opponents_board = Grid.new
    @ships = [Ship.new("A"), Ship.new("B"), Ship.new("S"), Ship.new("C"), Ship.new("P")]

    #make 5 ships and store in this array
    # s1 = Ship.new("B")
  end



  def place_ships
    @ships.each do |s|
      place(s)
    end
  end

  def place(s)
    puts 'Give me your coordinates'
    coord = gets.chomp
    puts 'Choose direction H or V'
    direction = gets.chomp
      if can_place?(coord, direction, s.size)
       @my_board.grid[coord.to_sym] = "s"
       @opponents_board.grid[coord.to_sym] = "s"
        puts 'Ship placed!'

    else
      puts 'Cant place boat here, try again.'
      place(s)
      end
  end

  def can_place? (coord, direction, size)
    true
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
