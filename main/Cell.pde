class Cell {
  private boolean isAlive;
  private int posX;
  private int posY;
  private int side;
  //private Cell[] neighbors;

  Cell(int posX, int posY, int side) {
    this.posX = posX;
    this.posY = posY;
    this.side = side;
    this.isAlive = false;
  }

  private boolean mouseIsOn() {
    return ((mouseX > this.posX) && (mouseX < this.posX + this.side) && (mouseY > this.posY) && (mouseY < this.posY + this.side));
  }

  private void changeState(){
    isAlive = !isAlive;
  }

  public void clickCell() {
    if ((mouseIsOn()) && (mousePressed)) {
      this.changeState();
    }
  }

  public void display() {
    fill(isAlive ? 240 : 20);
    rect(posX, posY, side, side);
  }
}
