OpenSimplexNoise noise = new OpenSimplexNoise();

void setup() {
  size(1000, 300);
  pixelDensity(2);
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(1);
  translate(0, height/2+50);
  scale(1, -1);
  float off = 0;
  int a = width;
  float media = 0;
  noFill();
  beginShape();
  float record = 0;
  float min = 0;
  int zero = 0;
  int max = 0;
  for (float i = 0; i < a; i++) {
    float y = (float)noise.eval(off, 0);
    if (y > record)
      record = y;
    if (y < min)
      min = y;
    if (y == 0)
      zero++;
    float corr = 5;
    float yv = y*100*corr;
    yv = abs(yv);
    if (yv >= 100*corr)
      max++;
    vertex(i*(width/a), yv);
    point(i*(width/a), yv);
    media += yv;
    off += 0.1;
  }
  endShape();
  media /= a;
  line(0, 100, width, 100);
  line(0, 0, width, 0);
  line(0, -100, width, -100);
  stroke(255, 100, 0);
  line(0, media, width, media);
  //point(0, 0);
  println(zero, max);
  stroke(0, 100, 255);
  line(0, 50, width, 50);
  noLoop();
}
