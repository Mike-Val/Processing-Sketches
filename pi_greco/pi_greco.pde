PVector[] points; //<>//
PVector center, point;
float in = 0;
float tot = 0;
double pi;

void setup() {
  size(600, 600);
  pixelDensity(2);
  points = new PVector[1];
  center = new PVector(width/2, height/2);
  background(0);
}

int a = 0;

//void draw() {
//  background(0);
//  stroke(255);
//  strokeWeight(3);
//  noFill();
//  rect(0, 0, width, height);
//  ellipse(width/2, height/2, width, height);
//  point(center.x, center.y);
//  for (int j = 0; j < 20; j++) {
//    strokeWeight(1);
//    points[a] = new PVector(random(0, width), random(0, height));
//    a++;
//    for (PVector i : points) {
//      if (i.dist(center) < width/2)
//        stroke(0, 255, 0);
//      else
//        stroke(255, 0, 155);
//      point(i.x, i.y);
//    }
//    if (points[points.length-1].dist(center) < width/2)
//      in++;
//    points = (PVector[]) expand(points, points.length+1);
//    pi = in/float(points.length-1)*4;
//    println(pi, points.length);
//  }
//  //println(points.length, in);
//}

void draw() {
  stroke(255);
  strokeWeight(3);
  noFill();
  rect(0, 0, width, height);
  ellipse(width/2, height/2, width, height);
  point(center.x, center.y);
  strokeWeight(1);
  for (int j = 0; j < 1000; j++) {
    point = new PVector(random(width), random(height));
    tot++;
    if (point.dist(center) <= width/2) {
      stroke(0, 255, 0);
      in++;
    } else
      stroke(255, 0, 155);
    point(point.x, point.y);
  }
  pi = in/tot*4;
  println(pi, tot);
}
