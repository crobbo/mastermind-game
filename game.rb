class Game

  def initialize(board)
    @board = board
    @choice = :choice
    @code = @board.code
    @matched_pegs = []
    @round = 1
  end

  def play
    puts "\n"
    puts "Can you CRACK the code? Let's go!"
    puts "\n"
    loop do      
      p @board.peg_colors
      puts 'Choose a peg colour:'
      choose_peg
      @board.current_choice.push(@choice)
      @board.codebreaker_display
      check_winner
      break if game_over? == true

      if @board.current_choice.length === 4 && @round < 12
        @round += 1
        codebreaker_feedback
        @board.cumulative_display
        reset_round
      elsif @board.current_choice.length < 4
        next
      else
        puts 'YOU LOSE! Computer wins!'
      end

    end
  end

  def choose_peg
    @choice = gets.chomp
  end

  def codebreaker_feedback
    @temp_code = @code.map(&:clone)
    @board.current_choice.each_with_index do |peg, i|
      if @code.index(peg) == i
        @board.feedback.push('Red')
        @temp_code[i] = ' '
      end 
    end     
    @board.current_choice.each_with_index do |pegg, i|
      if @temp_code.include?(pegg)
        @board.feedback.push('White')
        @temp_code[@temp_code.index(pegg)] = ' '
      end
    end

  @board.display_board[@board.current_choice] = @board.feedback

  end

  def game_over?
    @board.current_choice == @code
  end

  def check_winner
    if @board.current_choice === @code
      puts 'WINNER! You cracked the code!'
    end
  end

  def reset_round
    @board.current_choice = Array.new
    @matched_pegs.clear
    @board.feedback = Array.new
  end
end