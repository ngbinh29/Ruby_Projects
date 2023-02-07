# This is Stock Picker for Odin

## Project Guides and Instructions

Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

### Quick tips

- You need to buy before you can sell
- Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

## Approach Method - Naive

There are two scenarios in this problem:

1. The best day to buy comes before the best day to sell
2. The best day to buy comes after the best day to sell

With scenario no.1, it is easy to determine the pair of days which are the min price day and the max price day.
However the second one is more complex and intensive, in order to find the most profitable pair of days I list out all the possible combinations into a array. Then from that array I use `#max` method to determine the best out of all.

> This approach will ignore the second tip mentioned above, because the situation will produce a loss not a profit (negative value, 1 - 17 = -16)
