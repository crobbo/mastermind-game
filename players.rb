class Players
   attr_reader :peg_colors, :computer_player, :human_player
   def initialize
     @computer_player = :computer_player
     @human_player = :human_player
     @peg_colors = :peg_colors
   end

   def random_code
    mix_colors = peg_colors.shuffle
    mix_colors[0...4]
   end

   def pegs
    @peg_colors = ['Blue', 'Pink', 'Yellow', 'White', 'Purple', 'Green']
   end
end