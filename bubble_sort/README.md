# This is Bubble Sort for Odin

## Project Guides and Instructions

### Basic Understanding of Bubble Sort

When you dive deeper in the ocean of Computer Science, sorting algorithms are what you may encounter first along the path. One of the three main and basic algorithms to sort thing out is Bubble Sort.

The logic behind this is that you compare each element to the one next to it, if they are not in order swap them. The process is applied until the array is sorted.

For more information, check out this video from [CS50](https://www.youtube.com/watch?v=8Kp-8OGwphY) and this link from [Wikipedia](http://en.wikipedia.org/wiki/Bubble_sort)

## Target

To build the bubble sort algorithm from scratch, using `#sort` method is not allowed. What is the point of this project if you are using that method from the beginning?

## How to solve it

### Pseudo Code for Bubble Sort

Repeat n - 1 times
  For i from 0 to n - 2
      If number\[i\] and number[i + 1] out of order
        Swap them
    If no swap
      Quit`

n: size of the array

In order to swap, I use a `temp` variable, just like how to swap the water in two different cups with a third one.
