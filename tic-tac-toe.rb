require "pry"
require "set"

board = [1,2,3,4,5,6,7,8,9]

SOLUTIONS = [[0,1,2], [3,4,5], [6,7,8], 
			[1,4,7], [2,5,8], [0,3,6], 
			[0,4,8], [2,4,6]]

## DATA IN THE SYSTEM
# * board
# * player1 (name/piece), player2
# * win conditions
# * current_player => player1, player2
# !board.is_a (numeric)
def greeting
	puts
	puts "Welcome to Tic-Tac-Toe!"
	puts
	puts "#{player1_name} will be X, #{player2_name} will be O"
	puts "Each player will take a turn, first to connect
		  three in a row either horizontally, vertically or
		  diagonally wins. #{player1_name} will go first."

def display_board(board)
  puts "
    #{board[0]} | #{board[1]} | #{board[2]}
    #{board[3]} | #{board[4]} | #{board[5]}
    #{board[6]} | #{board[7]} | #{board[8]}
    "
end

def player_names_pieces
	puts "Player one enter your name: "
    player1_name = gets.chomp
    puts "Player two enter your name: "
    player2_name = gets.chomp
end

def win?(solutions)
	SOLUTIONS.each do |pos|
      if pos.all? {|p| player.pos.include? p}
        return true
      end
    false		
end

def draw?
 	!board.include?(1..9)
	puts "DRAW!"
end

def game_over?(solutions)
	win?(solutions) || draw?
end	

def update_board(current_player, board, selection)
	updated_board = board
	board.each do |selection|
		if board.include?(selection)
			updated_board.push(current_player)
		end
	updated_board
end		

def take_turn(current_player, selection)
	puts "#{current_player} choose board position: "
	selection = gets.chomp.to_i - 1
	until (1..9).include?(selection)
		puts "Thats not a board position, try again: "
		selection = gets.chomp.to_i - 1
	end
	selection
end		

def tic_tac_toe
	greeting
	player_names
	player1 = "X"
	player2 = "O"
	display_board
	current_player = player1
	until game_over?(solutions)
		selection = take_turn
		update_board

		if current_player == player1
		   current_player = player2
		else
			current_player = player1
		end
	system ("clear")
	end
	who_won(solutions)
end

def who_won(solutions)
	if win?(solutions)
		puts "Good job #{current_player}, you win!"
	else 
		draw?
	end
end	

def play_again?
  puts "Want to play Tic-Tac-Toe again? (y/n)"
  choice = gets.chomp.downcase

  until ["y", "n"].include?(choice)
    puts "Please choose 'Y' or 'N'."
    choice = gets.chomp.downcase
  end
  choice == "y"   
end

def play
  more = play_again?

  while more
    tic_tac_toe
    more = play_again?
  end
end