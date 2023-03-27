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
    if is_winner
      board.winner_name = name
      puts "player #{name} #{symbol} is the winner!"
    end
  end

  def turn
    selection = ask_selection
    row, col = selection
    # TODO this line of code need to be refactored
    if check_valid_selection
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

  def check_valid_selection
    negative_pos? || pos_already_chosen? || pos_out_of_grid?
  end

  def negative_pos?
    row, col = ask_selection
    position(row, col).negative?
  end

  def pos_already_chosen?
    row, col = ask_selection
    board.chosen_cells.include?(position(row, col)) || scores.include?(position(row, col))
  end

  def pos_out_of_grid?
    ask_selection[0] > 3 || ask_selection[1] > 3
  end
end
