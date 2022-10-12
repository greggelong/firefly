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
    // you can realy see the syc if you make all of the fireflyes have the same charge time and flashiness and flashLen
    flashiness =10+int(random(7));    // 10
    flashLen = 1+int(random(5));     // 3

  }
}
