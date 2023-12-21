class Cell {
  private boolean isAlive;
  private int posX;
  private int posY;
  private int side;
  private Cell[] neighbors;
  private boolean previousState;
  ;

  Cell(int posX, int posY, int side) {
    this.posX = posX;
    this.posY = posY;
    this.side = side;
    this.isAlive = false;
    this.previousState = isAlive;
  }

  public void setNeighbors(Cell[] neighbors) {
    this.neighbors = neighbors;
  }

  private boolean mouseIsOn() {
    return ((mouseX > this.posX) && (mouseX < this.posX + this.side) && (mouseY > this.posY) && (mouseY < this.posY + this.side));
  }

  public void display() {
    fill(isAlive ? 240 : 20);
    rect(posX, posY, side, side);
  }

  private void changeState() {
    isAlive = !isAlive;
  }

  public void clickCell() {
    if ((mouseIsOn()) && (mousePressed) && (mouseButton == LEFT)) {
      this.changeState();
      this.previousState = this.isAlive;
    }
  }

  public boolean getIsAlive() {
    return this.isAlive;
  }

  public boolean getPreviousState() {
    return this.previousState;
  }

  public void setPreviousState(boolean previousState) {
    this.previousState = previousState;
  }

  public void updateState() {
    int count = 0;
    for (int i = 0; i<8; i++) {
      if (this.neighbors[i].getPreviousState()) {
        count++;
      }
    }

    if (!(this.isAlive) && (count == 3)) {
      this.changeState();
    } else if ((this.isAlive) && ((count > 3) || (count < 2))) {
      this.changeState();
    }
  }
}
