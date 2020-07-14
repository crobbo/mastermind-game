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
    loop do
      p @round
      p @board.peg_colors
      puts 'Choose a peg colour:'
      choose_peg
      @board.current_choice.push(@choice)
      @board.codebreaker_display
      check_winner
      if @game_over
        break
      end
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
      if @code.rindex(peg) === @board.current_choice.rindex(peg)
        @board.feedback[@code.rindex(peg)] = 'Red'
      else
        @board.feedback[@code.rindex(peg)] = 'White'
      end
    end
      @board.display_board[@board.current_choice] = @board.feedback
  end

  def check_winner
    if @board.current_choice === @code
      @game_over = true
      puts 'WINNER! You cracked the code!'
    end
  end

  def reset_round
    @board.current_choice.clear
    @matched_pegs.clear
    @board.feedback === []
  end

end