class Star {
  float x;
  float y;
  float z;
  float pz;
  float xa, ya, za;

  Star() {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    z = random(height/2);
    pz = z;
    xa = x;
    ya = y;
    za = z;
  }

  void update() {
    z = z - speed;
    if (z < 1) {
      z = width/2;
      x = xa;
      y = ya;
      pz = z;
    }
  }

  void show() {
    col = color(map(z, 0, width*0.6, 0, 360), map(z, width/2.3, 0, 0, 200), 360);
    fill(col);
    noStroke();

    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);
    float r = map(z, 0, width/2, 4, 0);
    circle(sx, sy, r);
    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);

    pz = z;

    stroke(col);
    strokeWeight(r);
    line(px, py, sx, sy);
  }
}
