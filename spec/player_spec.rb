require 'grid'
require 'player'

describe 'Player' do

  subject { Player.new }
  let(:opponent) { Player.new }

  it 'it creates a my_board' do
    expect(subject.my_board).to be_kind_of Grid
  end

  it 'can place ship' do
    ship = subject.ships.pop
    expect(subject.can_place?(:a1, "D", ship)).to eq true
  end

   it 'ship cant be placed outside board' do
    ship = subject.ships.pop
    expect(subject.can_place?(:k1, "D", ship)).to eq false
  end

  it 'can receive a hit' do
    subject.place_ship(:a1)
    opponent.shoot_at(subject,:a1)
    expect(subject.my_board.grid).to include :a1 => "hit"
  end

  it 'can receive a miss' do
    subject.place_ship(:a2)
    opponent.shoot_at(subject,:a1)
    expect(subject.my_board.grid).to include :a1 => "miss"
  end

  it 'can shoot at opponent' do
  	subject.shoot_at(opponent,:a1)
  	expect(subject.opponents_board.grid).to include :a1 => "miss"
  end
end