# MASTERMIND: CODEBREAKER vs CODEMAKER

# Solution splits into Game, Board, Codebreaker & Codemaker classes

# Computer randomly selects from a choice of colours, 4 times to create a code and
# stores this in an Array

# Human codebreaker chooses a colour and the computer gives feedback based on
# their choice. Repeats 4 times. Codebreakers choice stored within an Array & feedback
# stored within an Array. Or both stored in a Hash? 

# The last step is repeat up to 12 times or until the code is broken. 

require_relative 'board.rb'
require_relative 'players.rb'
require_relative 'game.rb'

players = Players.new
pegs = players.pegs
code = players.random_code
board = Board.new(code, pegs)
game = Game.new(board)
game.play