class Board {
 Cell [][] grid;
 int size;
 
 
 Board(int size) {
   this.size = size;
   this.grid = new Cell[size][size];
    for(int i = 0 ; i < size ; i++) {
      for (int j = 0 ; j < size ; j++) {
        this.grid[i][j] = new Cell(i*32, j*32);
      }
    }      
  }

  void display() {
    for(int i = 0 ; i < grid.length ; i++) {
      for (int j = 0 ; j < grid.length ; j++) {
        grid[i][j].display();
      }
    }  
  }
  
  int getSize() {
    return this.size;
  }
  
  Cell[][] getGrid() {
    return this.grid;
  }
  
  Cell getCell(int x, int y){
    return grid[x][y];
  }
  
  
  
}
    
   

  
