class Ship
  attr_accessor :position, :size, :name, :hit

  def initialize(kind)

    case kind.upcase
    when "A"
      @name = "A"
      @size = 5
    when "B"
      @name = "B"
      @size = 4
    when "S"
      @name = "S"
      @size = 3
    when "C"
      @name = "C"
      @size = 2
    when "P"
      @name = "P"
      @size = 1
    else
      "W"
    end
  end

  def start_position(pos)
    @position = pos
  end

  #ubåt=u
  #ship = minsvepare = size=3 hits[]
end
