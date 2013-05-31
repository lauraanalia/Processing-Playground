import java.util.*;

int MAZE_WIDTH = 50;
int MAZE_HEIGHT = 30;
int MAZ_BLOCK_SIZE=20;
int WALL_SIZE=2;

Cell[][] cell = new Cell[MAZE_WIDTH][MAZE_HEIGHT];
Deque<Cell> stack = new ArrayDeque<Cell>();
Cell currentCell;
Cell targetCell;
boolean createMazeFinished=false;
boolean solveMazeFinished=false;

void setup() {
  size(MAZE_WIDTH*MAZ_BLOCK_SIZE, MAZE_HEIGHT*MAZ_BLOCK_SIZE);
  background(0);

  for (int y=0; y<MAZE_HEIGHT; y++) {
    for (int x=0; x<MAZE_WIDTH; x++) {
      cell[x][y] = new Cell(x, y);
    }
  }
  frameRate(25);
  currentCell = cell[0][0];
  currentCell.visited=true;
}


void draw() {
  background(0);
  
  if (!createMazeFinished) {
    doMaze();
    doMaze();doMaze();doMaze();doMaze();doMaze();doMaze();doMaze();
  } else {
    if (!solveMazeFinished) {
      solveMaze();
    }
  }
  
  for (int y=0; y<MAZE_HEIGHT; y++) {
    for (int x=0; x<MAZE_WIDTH; x++) {
      drawCell(cell[x][y]);
    }
  }   
}


void drawCell(Cell cell) {
  noStroke();
  fill(cell.col);
  boolean drawDot=false;
  if (cell.x==currentCell.x && cell.y==currentCell.y) {
    fill(color(255,0,0));
    drawDot=true;
  }

  if (targetCell!=null && (cell.x==targetCell.x && cell.y==targetCell.y)) {
    fill(color(0,255,0));
    drawDot=true;
  }
  
  int x2 = cell.x*MAZ_BLOCK_SIZE;
  int y2 = cell.y*MAZ_BLOCK_SIZE;  
  
  //draw unvisited cells flat/white
  if ((!createMazeFinished && !cell.visited) || drawDot) {
    rect(x2, y2, MAZ_BLOCK_SIZE, MAZ_BLOCK_SIZE);
    return;
  }
  
  if (createMazeFinished /*&& cell.bgCol>0*/) {
    fill(cell.bgCol);
    rect(x2, y2, MAZ_BLOCK_SIZE, MAZ_BLOCK_SIZE);
    fill(cell.col);
  }
  
 //top wall
  if (cell.walls[0]==1) 
  rect(x2, y2, MAZ_BLOCK_SIZE, WALL_SIZE);

  //left wall
  if (cell.walls[1]==1) 
  rect(x2, y2, WALL_SIZE, MAZ_BLOCK_SIZE);

  //right wall
  if (cell.walls[2]==1) 
  rect(x2+MAZ_BLOCK_SIZE-WALL_SIZE, y2, WALL_SIZE, MAZ_BLOCK_SIZE);

  //bottom wall
  if (cell.walls[3]==1) 
  rect(x2, y2+MAZ_BLOCK_SIZE-WALL_SIZE, MAZ_BLOCK_SIZE, WALL_SIZE);
}

