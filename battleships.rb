require 'sinatra/base'
require './lib/game'

class Battleships < Sinatra::Base

  enable :sessions
  set :views, File.join(root, '.', 'views')
  GAME = Game.new

  get '/' do
    p GAME
    @player1 = GAME.player(1)
    @player2 = GAME.player(2)
    @count = GAME.count 
    @game_started = GAME.started?
    erb :index2
  end

  post '/' do
    player = Player.new(params[:player_name])
    GAME.add(player)
    session['me']= player.object_id
    redirect to '/'
  end

  get '/reset' do
    session.clear
    GAME.reset!
    redirect to '/'
  end
end
