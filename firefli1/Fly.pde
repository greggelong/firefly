class Fly {
  // variables

  int x;
  int y;
  int state;  // 0 charging, 1, charged, 3 flash
  int chargeTime;
  int flashiness; // flash disposition, higher number less likely to flash
  int flashLen;


  //constructor

  Fly(int tx, int ty) {

    x = tx;
    y = ty;
    state = int(random(2));
    chargeTime = int(random(20))+21;
    flashiness = 10+int(random(7));
    flashLen = 1+int(random(5));
    ;
  }
}
