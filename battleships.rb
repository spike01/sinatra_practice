require 'sinatra/base'
require './lib/game'

class Battleships < Sinatra::Base

  enable :sessions
  set :views, File.join(root, '.', 'views')
  GAME = Game.new

  get '/' do
    p GAME
    erb :index2
  end

  post '/' do
    player = Player.new(params[:player_name])
    GAME.add(player)
    session['me']= player.object_id
    redirect to '/'
  end

  get '/reset' do
    GAME.players= []
    redirect to '/'
  end
end
