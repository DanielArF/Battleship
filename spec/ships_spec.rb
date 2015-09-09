require 'ship'

describe Ship do

  subject { Ship.new("A")}

  it 'creates a ship' do
    expect(subject).to be_kind_of Ship
  end

  it 'is an Aircaft Carrier' do
    expect(subject.name).to eq 'A'
  end

  it 'has a size of 5' do
    expect(subject.size).to eq 5
  end

  it 'can have a start position'do
    subject.start_position(:a1)
    expect(subject.position).to eq :a1
  end

  # it 'can recevie a hit' do
  #   expect(subject.hit).to eq 0
  # end

end
