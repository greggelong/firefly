Fly [] bugs;
int tick =0;
int totalBug = 75;

void setup() {
  size(800, 800);
  noCursor();
  bugs = new Fly[totalBug];
  for (int i = 0; i<totalBug; i++) {

    bugs[i] = new Fly(random(width), random(height));
  }
}


void draw() {
  //println(greg.flashLen, greg.chargeTime);
  background(0);
  noStroke();
  fill(15, 69, 211,150);
  ellipse(mouseX,mouseY,20,20);

  for (int i = 0; i<totalBug; i++) {

    bugs[i].show();
    bugs[i].update();
    bugs[i].checkEdges();
    // check neighorbor
    for (int n =0; n<totalBug; n++){
      if (bugs[i] != bugs[n]){
       bugs[i].neighborFlash(bugs[n]);
      }
    }
    bugs[i].move();
  }
  tick++;
}

void keyPressed(){
  for (int n =0; n<totalBug; n++){
    bugs[n].resetTrait();
  }
  
  
}
