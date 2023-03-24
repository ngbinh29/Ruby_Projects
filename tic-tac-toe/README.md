# This is Tic-tac-toe project for Odin

## Project Guide and Instructions

> Check out Tic-tac-toe thorough explanation on [Wikipedia](https://en.wikipedia.org/wiki/Tic-tac-toe)

### Target

The core aim of this Tic-tac-toe project is to practice and enhance understanding of OOP. Besides, programming this game also is what the project aims

## How to solve the problem

### Plan Ahead

Question No.1: What does this game need to be a Tic-tac-toe?

> It needs 2 players and a board to play on.

Question No.2: How to play the game?

> Two players take turns to cross out the three consecutive blocks in horizontal, vertical and diagonal axis.

According to these two mentioned above questions, there are two basic objects that makes the game work the way it should.

* Player
* Board

> Players play on different board each match and a Board will have two Players.

So that the relationship is that Board has many players and Players belong to distinctive Board.

Question No.2: How to check whether one of the two player wins?

> The program needs to keep track of what block player has crossed out or to be said that it has to store the moves of players in an array of scores. Then every time player makes a move, it checks if player's scores matches any of the win conditions

`win = [
      [0, 1, 2],
      [0, 3, 6],
      [3, 4, 5],
      [1, 4, 7],
      [2, 5, 8],
      [6, 7, 8],
      [0, 4, 8],
]`

> If any player wins, the game is exited and an winner announce is displayed.

### Work flow

The very first thing program need to know is player's name and the second thing is symbol player will use to play.
The symbol is needless to be exactly "X" or "O", it can be anything player likes as long as it has to be distinctive from what of other player.
Board instance is created when a new game is started.
Then the program instantiates player objects according to given information and a board to interact on.
First player goes first, then second player. Player one is asked where to go to on the board, right after that the game will check if there is any winner. If not, continue to asked player two's move and check the win conditions.
The board of the game will update every time players make their moves and is printed on the console.
This process will go on until there is one winner announced.
At that point when the current match is over, a notification will displayed asking whether or not players want to continue a new match.

### Build classes

1. What are the states and the methods of Player class?
2. What are the states and the methods of Board class?

Player class possesses name of the player, symbol player uses, record of moves and we also need to check if player is winner. Player is able to make move in each turn, then declare self is the winner.

Board class owns the grid and a list of players. Also board has the win conditions which is an array containing all the possible winning scenarios. Board can add players to itself and start a game.

#### Notices

1. Players cannot goes to checked position on the board, which means that if any of two players makes move on a marked cell the program would ask them to choose another selection.
2. Draw condition is that when all cells on the board are marked but no one meets the win conditions.
