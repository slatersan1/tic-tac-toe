require "pry"

board = [1,2,3,4,5,6,7,8,9]


## DATA IN THE SYSTEM
# * board
# * player1 (name/piece), player2
# * win conditions
# * current_player => player1, player2

def greeting
	puts
	puts "Welcome to Tic-Tac-Toe!"
	puts "Player1 will be X, Player2 will be O"
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

def win?(solutions)
	solutions
end

def draw()

end

def take_turn
	puts "#{current_player} choose board position: "
	selection = 