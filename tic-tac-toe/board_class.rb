class Board
  attr_accessor :grid, :players, :turn_count, :winner_name, :chosen_cells

  def initialize
    @grid = Array.new(3) { Array.new(3, '❓') }
    @players = []
    @turn_count = 0
    @winner_name = ''
    @chosen_cells = []
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

  def draw_condition
    turn_count == 9 && winner_name.empty?
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
      player_one, player_two = players
      player_one.turn
      break if player_one.is_winner ||draw_condition

      player_two.turn
      break if player_two.is_winner || draw_condition

    end
  end
end