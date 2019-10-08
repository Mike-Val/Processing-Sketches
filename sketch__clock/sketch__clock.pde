
void setup(){
  //size(800, 800);
  pixelDensity(2);
  fullScreen();
}

void draw(){
  background(25);
  
  float xm = map(mouseX, 0, width, 105, width-105);
  float ym = map(mouseY, 0, height, 105, height-105);
  
  clock(xm, ym);
  
}