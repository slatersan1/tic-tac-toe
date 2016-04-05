require "pry"

SOLUTIONS = [[1,2,3],
            [4,5,6],
            [7,8,9],
            [1,4,7],
            [2,5,8],
            [3,6,9],
            [1,5,9],
            [3,5,7]]

def greeting
  puts
  puts "Welcome to Tic-Tac-Toe!"
  puts
  puts "Each player will take a turn, first to connect
      three in a row either horizontally, vertically or
      diagonally wins. Player 1 will go first."
end

def display_board(board)
  puts "
    ---------
    | #{board[0]} | #{board[1]} | #{board[2]} |
    | #{board[3]} | #{board[4]} | #{board[5]} |
    | #{board[6]} | #{board[7]} | #{board[8]} |
    ---------
    "
end

def choose_player
  puts "Player 1 would you like to be 'X' or 'O' "
  piece = gets.chomp.upcase
  until ["X", "O"].include?(piece)
    puts "Please choose either 'X' or 'O' "
    piece = gets.chomp.upcase
  end
  piece
end  

def switch_player(player)
  player == "X" ? "O" : "X"
end

def win?(board)
	WINS.any? do |x, y, z|
    board[x - 1] == board[y - 1] && board[y - 1] == board[z - 1]
  end
end

def draw?(board)
 	board.all? { |piece| piece.is_a?(String) }
end

def game_over?(board)
	 win?(board) || draw?(board)
end	

def valid_turn(board)
  board.select { |piece| piece.is_a?(Fixnum) }
end

def take_turn(board, player)
	display_board(board)
  puts "#{player} choose board position: "
  choice = gets.chomp.to_i
  until valid_turn(board).include?(choice)
    puts "Please choose a numer between 1 and 9: " 
    choice = gets.chomp.to_i
  end
  choice - 1
end		

def tic_tac_toe
  board = (1..9).to_a
  current_player = choose_player
  greeting
  until game_over?(board)
    move = take_turn(board, current_player)
    board[move] = current_player
    current_player = switch_player(current_player) unless game_over?(board)
  end
  who_won(current_player, board)
end

def who_won(board, player)
  if win?(board)
    puts "Congratulations #{player} You win!!!!"
  elsif draw?(board)
    puts "DRAW!"
  else
    puts "Nice try #{player}. You suck."
  end
end

tic_tac_toe