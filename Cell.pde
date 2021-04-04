class Cell {
 int i;
 int j;
 int x;
 int y;
 int neighbours;
 boolean isBomb;
 boolean isRevealed; //is visible now
 boolean canBeRevealed; //once revealed, cannot be anymore;
 boolean isFlagged;
 
 
 Cell(int x, int y) {
   this.i = x/32;
   this.j = y/32;
   this.x = x;
   this.y = y;
   this.neighbours = 0;
   this.canBeRevealed=true;
   this.isFlagged = false;
   if(random(1)>0.85) {
     this.isBomb = true;
   } else {
     this.isBomb = false;
   }   
   this.isRevealed = false;
 }
 
 void display() {
   stroke(57, 240, 2);
   noFill();
   rect(this.x, this.y, 32,32);
   if(this.isRevealed) {
     if (this.isBomb) {
       stroke(57, 240, 2);
       fill(57, 240, 2);
       ellipse(this.x+cellSize/2 , this.y+cellSize/2, 16, 16);
     } else {
       if(this.neighbours==0) {
         fill(57, 240, 2);
         stroke(0);
         rect(this.x, this.y, cellSize, cellSize);
       } else {
         stroke(0);
         fill(57, 240, 2);
         rect(this.x, this.y, cellSize, cellSize);
         textAlign(CENTER);
         fill(0);
         text(this.neighbours, this.x+cellSize/2 , this.y+cellSize/3*2 );
       }       
     }
    }
 }
 boolean contains ( float x, float y) {
   return ( x > this.x && x < this.x+cellSize && y > this.y && y < this.y+cellSize);
 }
 
 void reveal() {
   this.isRevealed = true;
   if(this.canBeRevealed)this.checkNeighbours();
   this.canBeRevealed = false;
   if(this.neighbours == 0 ) floodFill();
 }
 
 int checkNeighbours() {
    if(this.isBomb) {
      neighbours = -1;
      return neighbours;
     }
     Cell[][] grid = board.getGrid();
     for (int i = -1 ; i <=1 ; i++) {
       for (int j = -1 ; j <=1 ; j++) {
         if(this.i+i == -1) i++;
         if(this.j+j == -1) j++;
         if(this.i+i == 20) break;
         if(this.j+j == 20) break;
         if(grid[this.i+i][this.j+j].isBomb) this.neighbours++;
       }
     }       
     return neighbours;
 }
 
 void floodFill() {
   Cell[][] grid = board.getGrid();
     for (int i = -1 ; i <=1 ; i++) { 
       for (int j = -1 ; j <=1 ; j++) {
         if(this.i+i == -1) i++;
         if(this.j+j == -1) j++;
         if(this.i+i == 20) break;
         if(this.j+j == 20) break;
         Cell neighbor = grid[this.i+i][this.j+j];
         if(!neighbor.isBomb && !neighbor.isRevealed){
           neighbor.reveal();
         }
       }
     }   
 }
 
 void drawFlag() {   
         fill(57, 240, 2);
         rect(this.x, this.y, cellSize, cellSize);         
         stroke(0);
         textAlign(CENTER);
         fill(0);
         text("X", this.x+cellSize/2 , this.y+cellSize/3*2 );
 }
 
 void setFlag(boolean b){   
   this.isFlagged=b;
   if(b) this.drawFlag();
   //if(!b) {
   //  stroke(0);
   //      fill(57, 240, 2);
   //      rect(this.x, this.y, cellSize, cellSize);
   //}
         
 }
   
 }
 
