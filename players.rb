class Players
   attr_accessor :peg_colors, :select_role, :select_player
   def initialize
    @peg_colors = :peg_colors
    @select_role = :select_role
    @select_player = :select_player
   end

   def random_code
    mix_colors = @peg_colors.shuffle
    mix_colors[0...4]
   end

   def player
    puts "Would you like to be the Codebreaker or Codemaker? Type your answser:"
    @select_role= gets.chomp
    @select_role = @select_role.downcase
   end
    
   def select_player(choice)    
    if choice == "codebreaker"
      @select_player = Codebreaker
    else
      @select_player = Codemaker
    end
   end

   def pegs
    @peg_colors = ['Blue', 'Pink', 'Yellow', 'White', 'Purple', 'Green']
   end

end

class Codemaker < Players
  def random_code
    get_code
  end

  def get_code    ## thids needs re-coding
    puts "\n"
    puts "Choose from these 6 pegs: "
    puts "#{@peg_colors}" 
    puts "\n"
    puts "OK. Let's go!"
    puts "Enter a colour & press enter. Choose 4."
    code = []
    while  code.length < 4
    code.push(gets.chomp)
    end
    code
  end
end

class Codebreaker < Players
  def initialize
    super
  end
end
