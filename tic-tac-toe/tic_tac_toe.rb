class Player
  attr_reader :name, :symbol
  attr_accessor :scores, :board, :is_winner

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @scores = []
    @is_winner = false
  end

  def position(row, column)
    (row - 1) * 3 + column - 1
  end

  def goes_to(row, column)
    scores << position(row, column)
    board.grid[row - 1][column - 1] = symbol
  end

  def winner
    win = board.win_conditions
    win.each do |condition|
      @is_winner ||= !is_winner if scores.intersection(condition) == condition
    end
    puts "#{name} is the winner!" if is_winner
  end

  def turn
    selection = ask_selection
    row, col = selection
    if scores.include?(position(row, col))
      turn
    else
      goes_to(row, col)
      board.display_grid
      winner
    end
  end

  def ask_selection
    selection = []
    puts "player #{name} please enter row and column"
    row = gets.chomp.to_i
    column = gets.chomp.to_i
    selection << row
    selection << column
    selection
  end
end

class Board
  attr_accessor :grid, :players

  def initialize
    @grid = Array.new(3) { Array.new(3, '❓') }
    @players = []
  end

  def win_conditions
    [
      [0, 1, 2],
      [0, 3, 6],
      [3, 4, 5],
      [1, 4, 7],
      [2, 5, 8],
      [6, 7, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
  end

  def display_grid
    grid.each do |row|
      puts '------------'
      row.each do |col|
        print "|#{col}|"
      end
      print "\n"
    end
    puts '------------'
  end

  def add_player(player)
    @players << player
    player.board = self
  end

  # ? should we create the main loop game method inside the class
  def start_game
    loop do
      player_one = players[0]
      player_two = players[1]
      player_one.turn
      p player_one.scores
      break if player_one.is_winner

      player_two.turn
      p player_two.scores
      break if player_two.is_winner
    end
  end
end

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
