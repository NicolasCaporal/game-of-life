# Conway's Game of Life
A simple version of Conway's Game of Life, in Processing (java).

The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970. It is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input. One interacts with the Game of Life by creating an initial configuration and observing how it evolves. It is Turing complete and can simulate a universal constructor or any other Turing machine.

#### Rules:

The universe of the Game of Life is an infinite, two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, live or dead (or populated and unpopulated, respectively). Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

* Any live cell with fewer than two live neighbours dies, as if by underpopulation.
* Any live cell with two or three live neighbours lives on to the next generation.
* Any live cell with more than three live neighbours dies, as if by overpopulation.
* Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

I made this version using a toroidal strategy or "pacman strategy" for the cells at the ends of the board.

## Controls
* Press **LEFT CLICK** to change the state of a cell *(live / dead)* 
* Press **SPACEBAR** to un-pause and pause the animation
* Press **R** to reset and clean the board
* Use **UP** and **DOWN** arrows to increase or decrease the speed of the animation 

## Reference
* [Conway's Game of Life Wikipedia](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)
* [processing.org](https://processing.org/)
