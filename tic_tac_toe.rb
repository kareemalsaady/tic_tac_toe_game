class TicTacToe
  def initialize
    $board = [1,2,3,4,5,6,7,8,9]
    @player1 = Player.new("Player 1",[])
    @player2 = Player.new("Player 2",[])
    @current_player = @player1
    draw_board
    switch_player
  end

  def draw_board
    puts "\n Board:"
    puts "\n
          |#{$board[0]}|#{$board[1]}|#{$board[2]}|
          |#{$board[3]}|#{$board[4]}|#{$board[5]}|
          |#{$board[6]}|#{$board[7]}|#{$board[8]}|
         "
  end

  def switch_player
    if @current_player == @player2
      @current_player = @player1
      puts "Player 1 turn"
      player_input
    elsif @current_player == @player1
      @current_player = @player2
      puts "Player 2 turn"
      player_input
    end
  end

  def player_input
    move = ""
    until $board.include?(move)
      puts "Enter your move"
      move = gets.chomp.to_i
     if $board.include?(move)
      player_move(move)
     elsif
      puts "Please enter a valid move, this move is either invalid or does not exist"
     end
    end
  end

  def player_move(move)
    if @current_player == @player1
     @player1.moves_taken << $board[move-1]
     $board[move-1]="X"
     draw_board
     winner(@player1.moves_taken)
    elsif @current_player == @player2
     @player2.moves_taken << $board[move-1]
     $board[move-1]="O"
     draw_board
     winner(@player2.moves_taken)
    end
  end

  def winner(moves_taken)
    winning_moves = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    p "#{@current_player.name} moves are #{moves_taken}"
    winning_moves.each do |a|
      if (a - moves_taken).empty?
       abort("#{@current_player.name} Wins!")
      end
    end
      if @player1.moves_taken.size + @player2.moves_taken.size >= 9
       abort("It's a draw.")
      else
        switch_player
      end
  end

end

class Player
  attr_accessor :name, :moves_taken
 def initialize(name, moves_taken)
  @name = name
  @moves_taken = []
 end
end

TicTacToe.new
