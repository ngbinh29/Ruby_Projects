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
    return unless is_winner

    board.winner_name = name
    puts "player #{name} #{symbol} is the winner!"
  end

  def turn
    selection = ask_selection
    row, col = selection
    # TODO: this line of code need to be refactored
    if board.chosen_cells.include?(position(row, col))
      turn
    else
      goes_to(row, col)
      board.display_grid
      winner
    end
    puts 'Draw' if board.draw_condition
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
