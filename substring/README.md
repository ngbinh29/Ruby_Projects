# This is Substring Project for Odin

## Project Guides and Instructions

> There is no further intels for this project, however there are several notes to keep in mind in order to complete the assignment.

### Target

Implement the `#substring` method that accepts two arguments:

1. the original string
2. the dictionary in array format

What the method does is that it counts how many a specific word (case insensitive) in the dictionary appears in each word of the original string.
The result is returned in a hash listing the words as key and the times as value.

Example:
`substrings("Howdy partner, sit down! How's it going?", dictionary)`
`=> { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }`

## How to solve it

### Notes

You may see that the method check every possible substring included in the text or sentence. In details, the method does not only check if the whole word is in the dictionary ("sit" is in the dictionary) but also the smaller substring like "i" or "it" which are also parts of word.

### Approach

So, to make it work properly, I need to check if the words in dictionary appears in every single word of the original string. Looping through the dictionary to make sure the dictionary word appears in given string is the suitable and possible approach for this method.

Keep in mind that is case insensitive for this time, I change the whole string to lower case by using `#downcase`. Then, `#reduce` is the proper and clean solution to comb over the problem and produce the desire result which is a hash listing the number of times a specific word from dictionary including in the original string.
