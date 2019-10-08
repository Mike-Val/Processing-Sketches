Star[] stars = new Star[800];
float speed;
color col;

int totalFrames;
int counter = 0;
boolean record = true;

float step;

void setup() {
  colorMode(HSB);
  pixelDensity(2);
  //size(800, 600, P3D);
  fullScreen();
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  //speed = map(mouseX, 0, width, 0, 10);
  //speed = 0.25;
  speed = 5;

  background(0, 100);
  translate(width/2, height/2);
  
  for (Star s : stars) {
    s.show();
    s.update();
  }
  
  step = (height)/speed;
  //println(speed);
  totalFrames = int(step);
  
  if (record) { 
    saveFrame("output/gif-"+nf(counter, 4)+".png");
    if (counter == totalFrames-1) {
      exit();
    }
  }
  println(counter);
  counter++;
}
