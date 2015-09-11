require 'grid'
require 'player'

describe Grid do

  it 'creates a grid' do
  	subject = Grid.new
  	expect(subject).to be_kind_of Grid
  end

  it 'creates water' do
  	subject = Grid.new
  	expect(subject.grid).to include :a1 => "w"
  end

    it 'grid is populated with coodinate keys' do
    [*:a..:b].each do |k|
      [*1..2].each do |v|
        key = [k, v].join('')
        expect(subject.grid).to include key.to_sym
      end
    end
  end


  it 'grid coodinate keys are set to water' do
    [*:a..:b].each do |k|
      [*1..2].each do |v|
        key = [k, v].join('')
        expect(subject.grid[key.to_sym]).to eq 'w'
      end
    end
  end



end