class Board

  attr_reader :code, :current_choice, :feedback, :peg_colors

  def initialize(code, pegs)      #instantiates with two arrays
    @code = code
    @current_choice = []
    @feedback = [nil, nil, nil, nil]
    @peg_colors = pegs
    @display_board = {}
  end

  def cumulative_display
    p @display_board
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