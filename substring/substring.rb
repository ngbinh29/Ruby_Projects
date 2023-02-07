# split string to array of words, check if each word includes the word in dictionary
def substring_v2(string, dictionary)
  string.split(' ').reduce(Hash.new(0)) do |result, word|
    dictionary.each { |element| result[element] += 1 if word.downcase.include?(element) }
    result
  end
end