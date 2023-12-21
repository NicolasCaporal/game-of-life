class Board {
  private int rows;
  private int columns;
  private int cellSide;
  private Cell[][] cells;
  
  Board(int rows, int columns, int cellSide){
    this.rows = rows;
    this.columns = columns;
    this.cellSide = cellSide;
    
    cells = new Cell[rows][columns]; //60 y 44

    for (int i = 0; i < rows; i++){
      for (int j = 0; j < columns; j++){
        cells[i][j] = new Cell(i*cellSide, j*cellSide, cellSide);
      }
    }
    
  }
  
  public void display(){
    fill(20);
    for (int i = 0; i < this.rows; i++){
      for (int j = 0; j < this.columns; j++){
        this.cells[i][j].display();
      }
    }
  }
  
  public void clickCell(){
      int row = mouseX/this.cellSide;
      int column = mouseY/this.cellSide;
      this.cells[row][column].clickCell();
  }
  
}
