Fly [][] grid;
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
  for (int j=0; j<rows; j=j+1) {
    for (int i=0; i<cols; i++) {
      //noStroke();
      grid[j][i] = new Fly(i, j);
    }
  }
}

void draw() {
  showGrid();
  tick++;
  update();
}

void update() {

  for (int j=0; j<rows; j=j+1) {
    for (int i=0; i<cols; i++) {
      Fly myfly = grid[j][i];
      //println(myfly.state,myfly.chargeTime, tick%myfly.chargeTime);
      if (myfly.state ==0 && tick%myfly.chargeTime == 0) {
        myfly.state =1;
      } else if (myfly.state ==1 && tick%myfly.flashiness == 0) {
        myfly.state =2;
      } else if (myfly.state ==2 && tick%myfly.flashLen == 0) {
        myfly.state =0;
      }
    }
  }
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
