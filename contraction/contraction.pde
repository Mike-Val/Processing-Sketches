float r = 350;
int cycles = 3;
ArrayList<ArrayList<float[]>> traces = new ArrayList<ArrayList<float[]>>();

void setup() {
  size(800, 800);
  for (int i = 0; i < 1000; i++) {
    float a = random(1) * TWO_PI;
    float[] t = {cos(a), sin(a)};
    ArrayList<float[]> trace = new ArrayList<float[]>();
    trace.add(t);
    traces.add(trace);
  }
  background(0);
  frameRate(10);
  pixelDensity(2);
}

void draw() {
  translate(width/2, height/2);
  //background(0);
  stroke(255);
  strokeWeight(0.1);
  
  if (cycles-- == 0) noLoop();
  
  for (ArrayList<float[]> trace : traces) {
    for (int i = 0; i < trace.size(); i++) {
      //stroke(map(i, 0, trace.size(), 100, 255));
      float[] coords = trace.get(i);
      float x = coords[0] * r;
      float y = coords[1] * r;
      if (i == 0) point(x, y);
      else {
        float[] prev = trace.get(i-1);
        line(prev[0] * r, prev[1] * r, x, y);
      }
    }
    float x = trace.get(trace.size() -1)[0];
    float y = trace.get(trace.size() -1)[1];
    float new_x = 0.7 * sin(x) + 0.2 * cos(y);
    float new_y = 0.7 * cos(x) + 0.2 * sin(y);
    float[] new_coords = {new_x, new_y};
    trace.add(new_coords);
  }
}
