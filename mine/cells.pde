class cells { //<>// //<>//
  float x, y;
  int ngh, s;
  cells (float xc, float yc, int sc) {
    x = xc;
    y = yc;
    s = sc;
    ngh = 0;
  }

  void check(int xp, int yp) {
    if (xp > 0 && yp > 0 && xp < l-1 && yp < l-1) {
      //println(xp, yp);
      if (s != 2) {
        for (int i = yp-1; i < yp+2; i++) {
          for (int j = xp-1; j < xp+2; j++) {

            if (v[i*l+j].s == 2)
              ngh++;
          }
        }
      } else {
        ngh = -1;
      }
    }

    if (yp == 0 && xp > 0 && xp < l-1) {
      //println(xp, yp);
      if (s != 2) {
        for (int i = yp; i < yp+2; i++) {
          for (int j = xp-1; j < xp+2; j++) {
            
            if (v[i*l+j].s == 2)
              ngh++;
          }
        }
      } else {
        ngh = -1;
      }
    }
    
    if (yp == l-1 && xp > 0 && xp < l-1) {
      //println(xp, yp);
      if (s != 2) {
        for (int i = yp-1; i < yp+1; i++) {
          for (int j = xp-1; j < xp+2; j++) {
            //strokeWeight(10);
            //point(x+(width/l)/2+20, y+(height/l)/2+30);
            //strokeWeight(5);
            //point(v[i*l+j].x+(width/l)/2+20, v[i*l+j].y+(height/l)/2+30);
            if (v[i*l+j].s == 2)
              ngh++;
          }
        }
      } else {
        ngh = -1;
      }
    }
    
    if (xp == 0 && yp > 0 && yp < l-1) {
      //println(xp, yp);
      if (s != 2) {
        for (int i = yp-1; i < yp+2; i++) {
          for (int j = xp; j < xp+2; j++) {
            
            if (v[i*l+j].s == 2)
              ngh++;
          }
        }
      } else {
        ngh = -1;
      }
    }
    
    if (xp == l-1 && yp > 0 && yp < l-1) {
      //println(xp, yp);
      if (s != 2) {
        for (int i = yp-1; i < yp+2; i++) {
          for (int j = xp-1; j < xp+1; j++) {
            
            if (v[i*l+j].s == 2)
              ngh++;
          }
        }
      } else {
        ngh = -1;
      }
    }
    
    if (xp == 0 && yp == 0) {
      //println(xp, yp);
      if (s != 2) {
        for (int i = yp; i < yp+2; i++) {
          for (int j = xp; j < xp+2; j++) {
            
            if (v[i*l+j].s == 2)
              ngh++;
          }
        }
      } else {
        ngh = -1;
      }
    }
    
    if (xp == l-1 && yp == 0) {
      //println(xp, yp);
      if (s != 2) {
        for (int i = yp; i < yp+2; i++) {
          for (int j = xp-1; j < xp+1; j++) {
            
            if (v[i*l+j].s == 2)
              ngh++;
          }
        }
      } else {
        ngh = -1;
      }
    }
    
    if (xp == l-1 && yp == l-1) {
      //println(xp, yp);
      if (s != 2) {
        for (int i = yp-1; i < yp+1; i++) {
          for (int j = xp-1; j < xp+1; j++) {
            
            if (v[i*l+j].s == 2)
              ngh++;
          }
        }
      } else {
        ngh = -1;
      }
    }
    
    if (xp == 0 && yp == l-1) {
      //println(xp, yp);
      if (s != 2) {
        for (int i = yp-1; i < yp+1; i++) {
          for (int j = xp; j < xp+2; j++) {
            
            if (v[i*l+j].s == 2)
              ngh++;
          }
        }
      } else {
        ngh = -1;
      }
    }
  }
}