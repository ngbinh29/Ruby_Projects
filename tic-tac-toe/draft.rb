grid = Array.new(3) { Array.new(3, '❓') }
p grid
win = [
      [0, 1, 2],
      [0, 3, 6],
      [3, 4, 5],
      [1, 4, 7],
      [2, 5, 8],
      [6, 7, 8],
      [0, 4, 8],
      [2, 4, 6]
]
# check if player scores match any of the win conditions
scores = [0, 3, 6]
is_winner = false
win.each do |condition|
  is_winner ||= !is_winner if scores.intersection(condition) == condition
end

puts is_winner
grid[0][0] = '❌'
grid.each do |row|
  puts '------------'
  row.each do |col|
    print "|#{col}|"
  end
  print "\n"
end
puts '------------'
puts "what's your name?"
name = gets.chomp
puts name


