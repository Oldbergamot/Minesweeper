
int cellSize = 32;
int boardDisplay = 0;
boolean isGameOver = false;
Board board;
void setup () {
  board = new Board(20);
  size(641,641);
  background(0);
  
}
  
  
  
void draw () {
  
  if(!isGameOver) board.display();
  if(isGameOver && boardDisplay <120) {
    board.display();
    boardDisplay++;
  }
  if(boardDisplay == 120) displayGameOver();
}



  void mousePressed() {
    if(mouseButton == LEFT){
      Cell[][] grid = board.getGrid();
      int size = board.getSize();
      for(int i = 0 ; i < size ; i++) {
          for (int j = 0 ; j < size ; j++) {
            if(grid[i][j].contains(mouseX, mouseY) && !grid[i][j].isFlagged) {
              grid[i][j].reveal();
              if(grid[i][j].isBomb) gameOver();
            }
          }
       }
    }
    if(mouseButton == RIGHT){
      Cell[][] grid = board.getGrid();
      int size = board.getSize();
      for(int i = 0 ; i < size ; i++) {
          for (int j = 0 ; j < size ; j++) {
            if(grid[i][j].contains(mouseX, mouseY) && !grid[i][j].isFlagged) grid[i][j].setFlag(true);
            if(grid[i][j].contains(mouseX, mouseY) && grid[i][j].isFlagged) grid[i][j].setFlag(false);
          }
       }      
    }
  }
  
  void gameOver() {
    isGameOver = true;
    Cell[][] grid = board.getGrid();
    int size = board.getSize();
    for(int i = 0 ; i < size ; i++) {
        for (int j = 0 ; j < size ; j++) {
          grid[i][j].isRevealed = true;
        }
    }
  }
  
  void displayGameOver(){    
    background(0);
    PFont f;
    f = createFont("Arial",16,true);
    textFont(f,72);
    fill(57, 240, 2);
    textAlign(CENTER);    
    text("Game Over",width/2,height/2);
}

 
