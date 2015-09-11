require './lib/grid.rb'
require './lib/ship.rb'

class Player
    attr_accessor :my_board, :opponents_board, :ships

  def initialize
    @my_board = Grid.new
    @opponents_board = Grid.new
    @ships = [Ship.new("A"), Ship.new("B"), Ship.new("S"), Ship.new("C"), Ship.new("P")]
  end

  def place_ship(ship, coord, direction)
    if all_water?(coord, ship.size, direction)
      ship.size.times do
        self.my_board.grid[coord] = ship.name
        case direction
        when :right
          coord = get_right_coord(coord)
        when :down
          coord = get_down_coord(coord)
        else
          raise 'You have to put in a direction'
        end
      end
    end
  end

  def all_water?(coord, size, direction)
    values = []
    size.times do
      values << (self.my_board.grid[coord] == 'w')
      coord = get_coord(coord, direction)
    end
    !values.include? false
  end

  def get_coord(coord, direction)
    #get_coord(:A1, :down)
    method_to_run = self.method("get_#{direction}_coord".to_sym)
    method_to_run.call coord
  end

  def water?(coord)
    @my_board.grid[coord.to_sym] == "w" ? true : false
  end

  def get_right_coord(coord)
    l = (coord[0].codepoints.first + 1).chr
    coord.to_s.gsub(coord[0], l).to_sym
  end

   def get_down_coord(coord)
    coord.next.to_sym
  end

  # def shoot_at(player,coord)
  #   oppboard = (player).my_board
  #     if oppboard.grid[coord] == 's'
  #      oppboard.grid[coord] = 'hit'
  #      @opponents_board.grid[coord] = 'hit'
  #    else
  #       oppboard.grid[coord] = 'miss'
  #       @opponents_board.grid[coord] = 'miss'
  #   end
  # end

end
