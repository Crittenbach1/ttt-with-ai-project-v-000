class Game
   attr_accessor :board, :player_1, :player_2, :winner

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
     end
     if @board.turn_count.even? == false
         return @player_2
     end
   end

   def over?
     if @board.full? == true
        return true
     else
       return false
     end
   end

   def won?
     won = false
        WIN_COMBINATIONS.each do |combo|
          if @board.cells[combo[0]] == @player_1.token &&
             @board.cells[combo[1]] == @player_1.token &&
             @board.cells[combo[2]] == @player_1.token then
           won = true
           @winner = @player_1.token
         elsif @board.cells[combo[0]] == @player_2.token &&
               @board.cells[combo[1]] == @player_2.token &&
               @board.cells[combo[2]] == @player_2.token then
           won = true
           @winner = @player_2.token
         end
       end

      return won
   end

  def draw?
    if @board.full? == true && self.won? == false
      true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == @player_1.token &&
         @board.cells[combo[1]] == @player_1.token &&
         @board.cells[combo[2]] == @player_1.token then
       return @player_1.token
     elsif @board.cells[combo[0]] == @player_2.token &&
           @board.cells[combo[1]] == @player_2.token &&
           @board.cells[combo[2]] == @player_2.token then
       return @player_2.token
     end
   end
   return nil
  end

  def turn
    player = self.current_player
   puts "enter a number 1 - 9"
    turn = player.move("")
   if @board.valid_move?(turn) == false
     while @board.valid_move?(turn) == false
     puts "try again"
     turn = player.move("")
     end
   end
   @board.update(turn, player)
   @board.display
  end

  def play
    until self.over? == true || self.won? == true || self.draw? == true
         self.turn
       end
         if self.won? == true
           puts "Congratulations #{@winner}!"
         end
         if self.draw? == true
           puts "Cat's Game!"
         end
  end

end
