class Cell {
  private boolean isAlive;
  private int posX;
  private int posY;
  private int side;
  private Cell[] neighbors;

  Cell(int posX, int posY, int side) {
    this.posX = posX;
    this.posY = posY;
    this.side = side;
    this.isAlive = false;
  }

  public void setNeighbors(Cell[] neighbors){
    this.neighbors = neighbors;
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
  
  public boolean getIsAlive(){
    return this.isAlive;
  }
  
  public void checkState(){
      int count = 0;
      for (int i = 0; i<8; i++){
        if (this.neighbors[i].getIsAlive()){
          count++;
        }
      }
      
      if (!(this.isAlive) && (count == 3)){
        this.changeState();
      } else if ((this.isAlive) && ((count > 3) || (count < 2))) {
        this.changeState();
      }
  }
}
