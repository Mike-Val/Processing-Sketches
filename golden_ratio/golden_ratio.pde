import peasy.*;
PeasyCam cam;

int points = 800;
float tf = 1.61803; 
float k = 0;

PVector[] vert = new PVector[points];

void setup() {
  size(800, 800, P3D);
  pixelDensity(2);
  cam = new PeasyCam(this, 0, 0, 0, 500);
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(2);
  noFill();
  //point(0, 0);
  
  for (int i = 0; i < points; i++) {
    //float r = sqrt(i / points * 180)*13;
    //float r = sqrt(i / points);
    //float a = TWO_PI*i*tf;
    
    float r = float(i) / points;
    
    float incl = asin(1 - 2*r);
    float azim = 2*PI*tf*i;

    float x = cos(incl + 0) * sin(azim + 0) * 100; // si puo mettere k al posto di 0 per ottenere dei movimenti strani
    float y = cos(incl + 0) * cos(azim + 0) * 100;
    float z = sin(incl + 0) * 100;
    
    vert[i] = new PVector(x, y, z);
  }
  
  for (PVector p : vert){
    //p.add(new PVector(mouseX-(width/2), mouseY-(height/2)));
    point(p.x, p.y, p.z);
  }
  
  k += 0.01;
}
