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
    board.turn_count += 1
    board.chosen_cells << position(row, column)
  end

  def winner
    win = board.win_conditions
    win.each do |condition|
      @is_winner ||= !is_winner if scores.intersection(condition).sort == condition
    end
    board.winner_name = name if is_winner
  end

  def turn
    selection = ask_selection
    row, col = selection
    if scores.include?(position(row, col)) || position(row, col).negative? || board.chosen_cells.include?(position(row, col))
      turn
    else
      goes_to(row, col)
      board.display_grid
      winner
    end
    puts "player #{name} #{symbol} is the winner!" if is_winner
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
