require 'byebug'
require 'sinatra/base'
require './lib/game.rb'
require './lib/grid.rb'
require './lib/player.rb'
require './lib/ship.rb'


class BattleshipsWeb < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions


  get '/' do
    #@visitor = params[:name]
    erb :index
  end

  get '/new_game' do
  #@visitor = params[:name]
  erb :new_game
  end

  post '/new_game' do
    #@visitor = params[:name]
    session[:name1] = params[:name]
     if session[:name] == ""
      erb :new_game
    else
      #1. Skapa Game.new
      #2. Skapa Player med namnet
      #3. Skapa en Board och tillskriv den till Player
      session[:p1] = Player.new
      session[:p2] = Player.new
      #@board = Board.new({size: 100, cell: Cell, number_of_pieces: 5})
      #@player.board = @board
      erb :board
    end
  end

  def name_required
    puts "You need to type in a name."

  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
