Fly [][] grid;
Fly [][] nextGrid;
int cols;
int rows;
int sz;
int tick =0;

void setup() {
  size(800, 800);
  frameRate(10);
  background(0);
  sz=8;
  cols = int(width/sz);
  rows = int(height/sz);
  grid = new Fly[rows][cols];
  nextGrid = new Fly[rows][cols];
  for (int j=0; j<rows; j=j+1) {
    for (int i=0; i<cols; i++) {
      //noStroke();
      grid[j][i] = new Fly(i, j);
    }
  }

  // make a copy of the same fireflys in next grid
  for (int j=0; j<rows; j=j+1) {
    for (int i=0; i<cols; i++) {
      //noStroke();
      nextGrid[j][i] = grid[j][i];
    }
  }
}

void draw() {
  showGrid();
  tick++;
  update();
}

void update() {

  for (int j=1; j<rows-1; j=j+1) {  // dont check edges
    for (int i=1; i<cols-1; i++) {
      Fly myfly = grid[j][i];
      Fly newfly = nextGrid[j][i];
      int [] flashNeighbors = neighborFlash(myfly);
      //println(myfly.state,myfly.chargeTime, tick%myfly.chargeTime);
      if (myfly.state ==0 && tick%myfly.chargeTime == 0) {
        newfly.state =1;

        // this will make them flash if they are charged and a neighbor has flashed
        // really affects their flash disposition they will not wait to flash
      } else if (myfly.state ==1 && flashNeighbors.length> 0) {
        // make it flash
        newfly.state =2; 
        // take the attributes of one of the flashers
        int choice = flashNeighbors[floor(random(flashNeighbors.length))];
        switch (choice) {
        case 1:
          newfly.chargeTime = grid[j-1][i-1].chargeTime; 
          newfly.flashiness = grid[j-1][i-1].flashiness;
          newfly.flashLen = grid[j-1][i-1].flashLen;
          break;
        case 2:
          newfly.chargeTime = grid[j-1][i].chargeTime; 
          newfly.flashiness = grid[j-1][i].flashiness;
          newfly.flashLen = grid[j-1][i].flashLen;
          break;
        case 3:
          newfly.chargeTime = grid[j-1][i+1].chargeTime; 
          newfly.flashiness = grid[j-1][i+1].flashiness;
          newfly.flashLen = grid[j-1][i+1].flashLen;
          break;
        case 4:
          newfly.chargeTime = grid[j][i-1].chargeTime; 
          newfly.flashiness = grid[j][i-1].flashiness;
          newfly.flashLen = grid[j][i-1].flashLen;
          break;

        case 5:
          newfly.chargeTime = grid[j][i+1].chargeTime; 
          newfly.flashiness = grid[j][i+1].flashiness;
          newfly.flashLen = grid[j][i+1].flashLen;
          break;
        case 6:
          newfly.chargeTime = grid[j+1][i-1].chargeTime; 
          newfly.flashiness = grid[j+1][i-1].flashiness;
          newfly.flashLen = grid[j+1][i-1].flashLen;
          break;
        case 7:
          newfly.chargeTime = grid[j+1][i].chargeTime; 
          newfly.flashiness = grid[j+1][i].flashiness;
          newfly.flashLen = grid[j+1][i].flashLen;
          break;
        case 8:
          newfly.chargeTime = grid[j+1][i+1].chargeTime; 
          newfly.flashiness = grid[j+1][i+1].flashiness;
          newfly.flashLen = grid[j+1][i+1].flashLen;
          break;
        }
      } else if (myfly.state ==1 && tick%myfly.flashiness == 0) {
        newfly.state =2;
      } else if (myfly.state ==2 && tick%myfly.flashLen == 0) {
        newfly.state =0;
      } else {
        newfly= myfly;
      }
    }
  }

  // arrayCopy(newWorld,world); this does not work  need to manually copy the array

  for (int j=0; j< rows; j++) {  //
    for (int i=0; i< cols; i++) {
      grid[j][i] = nextGrid[j][i];
    }
  }
}


int [] neighborFlash(Fly centerFly) {   // returns an array of flashing neighbors to randomly pick one
  int [] neighs ={};
  int i = centerFly.x;
  int j = centerFly.y;
  if (grid[j-1][i-1].state == 2) {
    neighs = append(neighs, 1);
  }
  if (grid[j-1][i].state ==2) {
    neighs = append(neighs, 2);
  }
  if (grid[j-1][i+1].state ==2) {
    neighs = append(neighs, 3);
  }
  if (grid[j][i-1].state ==2) {
    neighs = append(neighs, 4);
  }
  if (grid[j][i+1].state==2) {
    neighs = append(neighs, 5);
  }
  if (grid[j+1][i-1].state ==2) {
    neighs = append(neighs, 6);
  }
  if (grid[j+1][i].state ==2) {
    neighs = append(neighs, 7);
  }
  if (grid[j+1][i+1].state ==2) {
    neighs = append(neighs, 8);
  }

  return neighs;
}

void showGrid() {
  background(0);
  for (int j=0; j<rows; j=j+1) {
    for (int i=0; i<cols; i++) {
      //noStroke();
      if (grid[j][i].state == 0) {
        fill(255, 0, 0, 80);
      } else if (grid[j][i].state ==1) {
        fill(0, 255, 0, 80);
      } else if (grid[j][i].state == 2) {
        fill(255, 255, 0);
      }
      rect(i*sz, j*sz, sz, sz);
    }
  }
}
