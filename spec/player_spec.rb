require 'grid'
require 'player'

describe 'Player' do

  subject { Player.new }
  let(:opponent) { Player.new }

  it 'it creates a my_board' do
    expect(subject.my_board).to be_kind_of Grid
  end

  xit 'can place ship' do
    ship = subject.ships.pop
    expect(subject.can_place?(:a1, "D", ship)).to eq true
  end

   xit 'ship cant be placed outside board' do
    ship = subject.ships.pop
    expect(subject.can_place?(:k1, "D", ship)).to eq false
  end

  xit 'can receive a hit' do
    subject.place_ship(:a1)
    opponent.shoot_at(subject,:a1)
    expect(subject.my_board.grid).to include :a1 => "hit"
  end

  xit 'can receive a miss' do
    subject.place_ship(:a2)
    opponent.shoot_at(subject,:a1)
    expect(subject.my_board.grid).to include :a1 => "miss"
  end

  xit 'can shoot at opponent' do
  	subject.shoot_at(opponent,:a1)
  	expect(subject.opponents_board.grid).to include :a1 => "miss"
  end

  describe 'placin ships' do

    it 'can place a u-boat in direction :right' do
      #byebug
      ship = subject.ships.find {|n| n.name == 'P'}
      subject.place_ship(ship, :a1, :right)
      expect(subject.my_board.grid[:a1]).to eq 'P'
    end

    it 'can place a u-boat in direction :right' do
      #byebug
      ship = subject.ships.find {|n| n.name == 'P'}
      subject.place_ship(ship, :a1, :down)
      expect(subject.my_board.grid[:a1]).to eq 'P'
    end

    it 'can place a cruise in direction :right' do
      ship = subject.ships.find {|n| n.name == 'C'}
      subject.place_ship(ship, :a1, :right)
      expect(subject.my_board.grid[:a1]).to eq 'C'
      expect(subject.my_board.grid[:b1]).to eq 'C'
    end

    it 'can place a cruise in direction :down' do
      ship = subject.ships.find {|n| n.name == 'C'}
      subject.place_ship(ship, :a1, :down)
      expect(subject.my_board.grid[:a1]).to eq 'C'
      expect(subject.my_board.grid[:a2]).to eq 'C'
    end

    it 'does not place a cruise if out of bounds' do
      ship = subject.ships.find {|n| n.name == 'C'}
      subject.place_ship(ship, :b2, :down)
      expect(subject.my_board.grid[:b2]).to eq 'w'
    end
  end
end