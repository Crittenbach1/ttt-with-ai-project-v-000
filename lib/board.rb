class Board
   attr_accessor :cells

   def initialize
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def reset!
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def display
     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end

   def position(input)
     position = input.to_i - 1
     @cells[position]
   end

   def full?
      if @cells.include?(" ")
         false
       else
         true
      end
   end

   def turn_count
     count = 0
     @cells.each do |cell|
       if cell != " "
          count += 1
       end
   end
   count
   end

   def taken?(input)
      position = input.to_i - 1
      if @cells[position] != " "
         true
      else
        false
      end
   end

   def valid_move?(input)
     if input.to_i.between?(1,9) && self.taken?(input) == false
      true
    else
      false
    end
   end

   def update(position, player)
      pos = position.to_i - 1
      @cells[pos] = player.token
   end

end
