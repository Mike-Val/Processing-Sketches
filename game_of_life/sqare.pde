class sqr {
  float x, y;
  int s, n;
  sqr(float xc, float yc) {
    x = xc;
    y= yc;
    s = 0;
    n = 0;
  }

  void check(int i) {
    n = 0;
    if (i%l != 0 && i%l-(l-1) != 0 && i >= l && i <= L-l){
      //s=1;
      for (int j = -1; j < 2; j++){
        for (int k = -1; k < 2; k++){
          //println(i, i+j+k*l);
          if (grid[i+j+k*l].s == 1 && i+j+k*l != i)
            n++;
        }
      }
    }

    if (i%l != 0 && i%l-(l-1) != 0 && i < l) {
      for (int j = -1; j < 2; j++) {
        for (int k = 0; k < 2; k++) {
          //println(i, i+j+k*l);
          //grid[i+j+k*l].s=1;
          if (grid[i+j+k*l].s == 1 && i+j+k*l != i)
            n++;
        }
      }
    }


    if (i%l != 0 && i%l-(l-1) != 0 && i > L-l) {
      for (int j = -1; j < 2; j++) {
        for (int k = -1; k < 1; k++) {
          //println(i, i+j+k*l);
          //grid[i+j+k*l].s=1;
          if (grid[i+j+k*l].s == 1 && i+j+k*l != i)
            n++;
        }
      }
    }

    if (i%l-(l-1) == 0 && i > l && i < L-l) {
      for (int j = -1; j < 1; j++) {
        for (int k = -1; k < 2; k++) {
          //println(i, i+j+k*l);
          //grid[i+j+k*l].s=1;
          if (grid[i+j+k*l].s == 1 && i+j+k*l != i)
            n++;
        }
      }
    }


    if (i%l == 0 && i >= l && i < L-l) {
      for (int j = 0; j < 2; j++) {
        for (int k = -1; k < 2; k++) {
          //println(i, i+j+k*l);
          //grid[i+j+k*l].s=1;
          if (grid[i+j+k*l].s == 1 && i+j+k*l != i)
            n++;
        }
      }
    }
    
    if (i == 0) {
      for (int j = 0; j < 2; j++) {
        for (int k = 0; k < 2; k++) {
          //println(i, i+j+k*l);
          //grid[i+j+k*l].s=1;
          if (grid[i+j+k*l].s == 1 && i+j+k*l != i)
            n++;
        }
      }
    }
    
    if (i == L-1) {
      for (int j = -1; j < 1; j++) {
        for (int k = -1; k < 1; k++) {
          //println(i, i+j+k*l);
          //grid[i+j+k*l].s=1;
          if (grid[i+j+k*l].s == 1 && i+j+k*l != i)
            n++;
        }
      }
    }
    
    if (i == L-l) {
      for (int j = 0; j < 2; j++) {
        for (int k = -1; k < 1; k++) {
          //println(i, i+j+k*l);
          //grid[i+j+k*l].s=1;
          if (grid[i+j+k*l].s == 1 && i+j+k*l != i)
            n++;
        }
      }
    }
    
    if (i == l-1) {
      for (int j = -1; j < 1; j++) {
        for (int k = 0; k < 2; k++) {
          //println(i, i+j+k*l);
          //grid[i+j+k*l].s=1;
          if (grid[i+j+k*l].s == 1 && i+j+k*l != i)
            n++;
        }
      }
    }
  }
  

}
