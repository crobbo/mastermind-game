require_relative 'board.rb'
require_relative 'players.rb'
require_relative 'game.rb'

play = Players.new

codebreaker_or_codemaker = play.player
select_player = play.select_player(codebreaker_or_codemaker)

player = select_player.new
pegs = player.pegs
code = player.random_code

board = Board.new(code, pegs)
game = Game.new(board)

if select_player == Codemaker
  game.computer_play
else
  game.play
end



# THE BELOW WORKS FOR A GAME WITH A SINGLE 
# CODEBREAKER MODE

# players = Players.new
# pegs = players.pegs
# code = players.random_code
# board = Board.new(code, pegs)
# game = Game.new(board)
# game.play