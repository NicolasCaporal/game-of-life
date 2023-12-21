Cell cell;
Board board;
final int cellSide = 16;
boolean pause = true;

void setup() {
  size(960, 704);
  surface.setTitle("Game of Life");
  stroke(30);
  delay(0);
  // rectMode(CENTER); // borrar
  board = new Board(60, 44, cellSide);
  
}

void mousePressed() {
  if (mouseButton == LEFT){
    board.clickCell();
  }
}

void keyPressed(){
  if (key == ' '){
      pause = !pause;
  } else if (key == 'r' || key == 'R'){
    board = new Board(60, 44, cellSide);
  }
}

void draw() {
  background(200);  // Limpiar el fondo en cada fotograma  
  board.display(pause);
  println(pause, frameRate);
  delay(pause ? 0 : 200);
  //println("(", mouseX/16, ",", mouseY/16, ")");
}
