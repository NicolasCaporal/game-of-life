Cell cell;
Board board;
final int cellSide = 16;

void setup() {
  size(960, 704);
  stroke(30);
  // rectMode(CENTER); // borrar
  //cell = new Cell(100, 100);
  board = new Board(60, 44, cellSide);
  
}

void mousePressed() {
  if (mouseButton == LEFT){
    board.clickCell();
  }
}


void draw() {
  background(200);  // Limpiar el fondo en cada fotograma  
  board.display();
  //println(mouseX, "(",mouseX/16, ",", mouseY/16, ")");
}
