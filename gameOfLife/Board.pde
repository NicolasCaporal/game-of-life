class Board {
  private int rows;
  private int columns;
  private int cellSide;
  private Cell[][] cells;
  private boolean[][] previousState;


  Board(int rows, int columns, int cellSide) {
    this.rows = rows;
    this.columns = columns;
    this.cellSide = cellSide;
    this.initializeCells();
  }

  private void initializeCells() {
    this.cells = new Cell[rows][columns]; //60 y 44
    this.previousState = new boolean[rows][columns];
    this.instantiateCells();
    this.setNeighborsCells();
  }

  private void instantiateCells() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        cells[i][j] = new Cell(i*cellSide, j*cellSide, cellSide);
        previousState[i][j] = false;
      }
    }
  }

  private void setNeighborsCells() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        // println("CASILLA (", i, ",", j, " --> ", i-1, " % 60 = ", (i - 1 + this.rows) % this.rows);
        Cell[] neighbors = new Cell[8];
        neighbors[0] = this.cells[(i - 1 + this.rows) % this.rows][(j - 1 + this.columns) % this.columns];
        neighbors[1] = this.cells[(i + this.rows) % this.rows][(j - 1 + this.columns) % this.columns];
        neighbors[2] = this.cells[(i + 1) % this.rows][(j - 1 + this.columns) % this.columns];
        neighbors[3] = this.cells[(i - 1 + this.rows) % this.rows][(j + this.columns) % this.columns];
        neighbors[4] = this.cells[(i + 1) % this.rows][(j + this.columns) % this.columns];
        neighbors[5] = this.cells[(i - 1 + this.rows) % this.rows][(j + 1) % this.columns];
        neighbors[6] = this.cells[(i + this.rows) % this.rows][(j + 1) % this.columns];
        neighbors[7] = this.cells[(i + 1) % this.rows][(j + 1) % this.columns];

        this.cells[i][j].setNeighbors(neighbors);
      }
    }
  }

  private void copyPreviousState() {
    for (int i = 0; i < this.rows; i++) {
      for (int j = 0; j < this.columns; j++) {
        this.previousState[i][j] = this.cells[i][j].getIsAlive();
      }
    }
  }

  private void updatePreviousState() {
    for (int i = 0; i < this.rows; i++) {
      for (int j = 0; j < this.columns; j++) {
        this.cells[i][j].setPreviousState(this.previousState[i][j]);
      }
    }
  }

  public void display(boolean pause) {
    this.copyPreviousState();
    for (int i = 0; i < this.rows; i++) {
      for (int j = 0; j < this.columns; j++) {
        if (!pause) {
          this.cells[i][j].updateState();
        }
        this.cells[i][j].display();
      }
    }
    this.updatePreviousState();
  }

  public void clickCell() {
    int row = mouseX/this.cellSide;
    int column = mouseY/this.cellSide;
    this.cells[row][column].clickCell();
  }
}
