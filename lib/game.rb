class Game
   attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],
                         [1,4,7],[2,5,8],[0,4,8],[2,4,6]  ]

def initialize(player_1 = " ", player_2 = " ", board = " ")
   if player_1 == " "
      @player_1 = Players::Human.new("X")
    else
      @player_1 = player_1
   end
   if player_2 == " "
      @player_2 = Players::Human.new("O")
    else
      @player_2 = player_2
   end
   if board == " "
      @board = Board.new
    else
      @board = board
   end
 end

   def current_player
     if @board.turn_count.even?
          return @player_1
     else
         return @player_2
     end
   end

   def won?
     WIN_COMBINATIONS.each do |combos|
        combos.each do |combo|
          if @board[combo[0]] == @board[combo[1]] &&
             @board[combo[0]] == @board[combo[2]] &&
             @board[combo[1]] == @board[combo[2]] then
           return true
          end
        end
     end
    return false
   end





end
