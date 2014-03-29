require "bundler/setup"
require "sinatra"
require "haml"
require "./RockPaperScissors"

get '/' do
  haml :index, :format => :html5
end


post '/play' do
  if params['p1play'] != 'computer'
    @player1 = Player.new(params['p1name'])
    @player1play = params["p1play"].to_sym
  else
    @player1 = Player.new("Computer 1")
    @player1play = PLAYS.shuffle.first
  end
  if params['p2play'] != 'computer'
    @player2 = Player.new(params['p2name'])
    @player2play = params["p2play"].to_sym
  else
    @player2 = Player.new("Computer 2")
    @player2play = PLAYS.shuffle.first
  end
  game = RockPaperScissors.new(@player1, @player2)
  @winner = game.play(@player1play, @player2play)
  if @winner != RockPaperScissors::TieClass
    haml :wins, :format => :html5
  else
    haml :tie, :format => :html5
  end
end