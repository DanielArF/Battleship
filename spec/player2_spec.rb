require 'grid'
require 'player2'

describe 'Player2' do

  subject { Player.new }

  it 'it creates a my_board' do
    expect(subject.my_board).to be_kind_of Grid
  end

  it 'can place ship' do
    subject.place_ship(:a1)
    expect(subject.my_board.grid).to include :a1 => "s"
  end

  it 'can receive a hit' do
    subject.place_ship(:a1)
    subject.shoot_at(:a1)
    expect(subject.my_board.grid).to include :a1 => "hit"
  end

  it 'can receive a miss' do
    subject.place_ship(:a2)
    subject.shoot_at(:a1)
    expect(subject.my_board.grid).to include :a1 => "miss"
  end
end