class Game

  def initialize(board)
    @board = board
    @choice = :choice
    @code = @board.code
    @matched_pegs = []
    @round = 1
    @game_over = false
  end

  def play
    p @code
    p @board.peg_colors
    loop do
      puts 'Choose a peg colour:'
      choose_peg
      @board.current_choice.push(@choice)
      @board.codebreaker_display
      check_winner
      break if @game_over === true
      if @board.current_choice.length === 4 && @round < 12
        @round += 1
        codebreaker_feedback
        @board.cumulative_display
        reset_round
        play
      elsif @board.current_choice.length < 4
        play
      else
        puts 'YOU LOSE! Computer wins!'
      end
    end
  end

  def choose_peg
    @choice = gets.chomp
  end

  def codebreaker_feedback
    @matched_pegs = @code & @board.current_choice
    @matched_pegs.each do |peg|
      if @code.index(peg) === @board.current_choice.index(peg)
        @board.feedback[@code.index(peg)] = 'Red'
      else 
        @board.feedback[@code.index(peg)] = 'White'
      end
    end
      @board.display_board[@board.current_choice] = @board.feedback
  end

  def check_winner
    if @board.current_choice === @code
      @game_over = true
      p @game_over
      puts 'WINNER! You cracked the code!'
    end
  end

  def reset_round
    @board.current_choice = Array.new
    @matched_pegs.clear
    @board.feedback = Array.new(4, nil)
  end
end