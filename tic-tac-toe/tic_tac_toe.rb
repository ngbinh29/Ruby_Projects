require_relative 'players_class'
require_relative 'board_class'

# Main game loop
puts 'Welcome to Tic-tac-toe'
puts '----------------------'
puts "Player one's name"
player_one_name = gets.chomp
puts "Player two's name"
player_two_name = gets.chomp
player_one_symbol = '❌'
player_two_symbol = '⭕'
player_one = Player.new(player_one_name, player_one_symbol)
player_two = Player.new(player_two_name, player_two_symbol)
board = Board.new
board.add_player(player_one)
board.add_player(player_two)
board.display_grid
board.start_game
