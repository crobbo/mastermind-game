class Board

  attr_reader :code, :current_choice, :peg_colors, :display_board
  attr_accessor :current_choice,:feedback

  def initialize(code, pegs)      #instantiates with two arrays
    @code = code
    @current_choice = []
    @feedback = []
    @peg_colors = pegs
    @display_board = {}
  end

  def cumulative_display
    puts '--------------------------------------------------'
    puts '--------------------------------------------------'
    puts '--------------------------------------------------'
    puts '--------------------------------------------------'
    puts 'CURRENT BOARD: Pegs => Feedback'
    require 'pp'
    pp @display_board
    puts '--------------------------------------------------'
    puts '--------------------------------------------------'
    puts '--------------------------------------------------'
    puts '--------------------------------------------------'
  end

  def codebreaker_display
    puts '--------------------------------------------------'
    puts "Your selection: #{@current_choice}"
    puts '--------------------------------------------------'
  end

  def codemaker_display
    puts "Computer feedback #{@feedback}"
    puts '--------------------------------------------------'
  end
end