int fr = 10;
final int cellSide = 16;
boolean pause = true;
Board board;


void setup() {
  size(960, 704);
  surface.setTitle("Game of Life");
  stroke(30);
  board = new Board(60, 44, cellSide);
  constrain(frameRate, 5, 60);
}

void mousePressed() {
  board.clickCell();
}

void keyPressed() {
  if (key == ' ') {
    pause = !pause;
    println("Pause");
  } else if (key == 'r' || key == 'R') {
    board = new Board(60, 44, cellSide);
  } else if (key == CODED) {
    if ((keyCode == UP) && (fr < 60)) {
      fr += 5;
    } else if ((keyCode == DOWN) && (fr > 5)) {
      fr -= 5;
    }
  }
}

void draw() {
  background(200);
  board.display(pause);
  if (!pause) {
    println(frameRate);
  }
  frameRate(pause ? 60 : fr);
}
