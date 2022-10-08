class Fly {
  // variables

  int state;  // 0 charging, 1, charged, 3 flash
  int chargeTime;
  int flashiness; // flash disposition, higher number less likely to flash
  int flashLen;
  int sz;
  PVector loc;
  PVector vel;
  PVector acc;
  float topspeed;
  boolean nFlash; // neighbor flash toggel


  //constructor

  Fly(float tx, float ty) {

    loc = new PVector(tx, ty);
    vel = new PVector(0, 0);
    sz = 20;
    topspeed = 2+int(random(2));
    state = int(random(2));
    chargeTime =  20+ int(random(10));
    // you can realy see the syc if you make all of the fireflyes have the same charge time and flashiness and flashLen
    flashiness =10+int(random(7));    // 10
    flashLen = 20+int(random(5));     // 3
  }


  void show() {
    if (state == 0) {
      fill(255, 0, 0, 90);
      sz = 10;
    } else if (state ==1) {
      fill(0, 255, 0, 90);
      sz = 10;
    } else if (state == 2) {
      fill(247, 158, 36, 150);
      sz = 30;
    }
    ellipse(loc.x, loc.y, sz, sz);
  }

  void update() {

    if (state ==0 && tick%chargeTime == 0) {
      state =1;

      // this will make them flash if they are charged and a neighbor has flashed
      // really affects their flash disposition they will not wait to flash
    } else if (state ==1 && nFlash == true) {
      state =2;
    } else if (state ==1 && tick%flashiness == 0) {
      state =2;
    } else if (state ==2 && tick%flashLen == 0) {
      state =0;
    }
  }


  void move() {
    // move toward the mouse if pressed
    if (mousePressed) {
      PVector mouse = new PVector(mouseX, mouseY);
      PVector dir = PVector.sub(mouse, loc);

      //Normalize.

      dir.normalize();

      ///Scale.

      dir.mult(0.05);

      //Set to acceleration.

      acc = dir;
    } else {
      // else mover randomly
      acc = PVector.random2D();
      acc.mult(0.05);
    }
    // add in acelleration
    vel.add(acc);
    vel.limit(topspeed);
    loc.add(vel);
  }

  void neighborFlash(Fly vt) { // takes a fly 
    PVector v2 = vt.loc; // gets location vector
    if (loc.dist(v2) < sz*5) {   // the bugs can see 1/4 the way across the field
      nFlash = true;
      chargeTime = vt.chargeTime;
      flashLen= vt.flashLen;
      flashiness= vt.flashiness;
    } else {
      nFlash = false;
    }
  }

  void checkEdges() {
    if (loc.x > width) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }

    if (loc.y > height) {
      loc.y = 0;
    } else if (loc.y < 0) {
      loc.y = height;
    }
  }
  
  void resetTrait(){
    
    chargeTime =  20+ int(random(10));
    // you can realy see the syc if you make all of the fireflyes have the same charge time and flashiness and flashLen
    flashiness =10+int(random(7));    // 10
    flashLen = 20+int(random(5));     // 3
    
    
  }
  
}
