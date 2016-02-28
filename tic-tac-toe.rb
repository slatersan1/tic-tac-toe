require "pry"
require "set"

board = [1,2,3,4,5,6,7,8,9]

solutions = [[board{0}, board{1}, board{2}], [board{3}, board{4}, board{5}], [board{7}, board{8}, board{9}], 
			[board{1}, board{4}, board{7}], [board{2}, board{}5, board{8}], [board{3}, board{6}, board{9}], 
			[board{1}, board{5}, board{7}], [board{3}, board{5}, board{7}]]

player1 = "X"
player2 = "O"

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
	puts "#{Player1} will be X, #{Player2} will be O"
	puts "Each player will take a turn, first to connect
		  three in a row either horizontally, vertically or
		  diagonally wins."

def display_board(board)
  puts "
    #{board[0]} | #{board[1]} | #{board[2]}
    #{board[3]} | #{board[4]} | #{board[5]}
    #{board[6]} | #{board[7]} | #{board[8]}
    "
end

def player_names
	puts "Player one enter your name: "
    player1 = gets.chomp
    puts "Player two enter your name: "
    player2 = gets.chomp

def win?(solutions)
	if 

    end
		
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
	until (0..8).include?(selection)
		puts "Thats not a board position, try again: "
		selection = gets.chomp.to_i - 1
	end
	selection
end		

def tic_tac_toe
	
	greeting
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
			




















