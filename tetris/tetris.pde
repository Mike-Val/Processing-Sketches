int div = 10;
float delta;
block[] grid;

void setup() {
  size(600, 600);
  delta = width/div;
  grid = new block[div*div];

  for (int y = 0; y < div; y++) {
    for (int x = 0; x < div; x++) {
      grid[index(x, y)] = new block(x, y);
    }
  }
}

void draw() {
  background(0);
  stroke(255);
  
  
  

  for (block b : grid) {
    fill(map(b.tp, 0, 8, 0, 255));
    square(b.x*delta, b.y*delta, delta);
  }
}

int index(int x, int y) {
  return x+y*div;
}

void generate(int x){
  grid[index(x, 0)].tp = int(random(8)+1);
}

void mousePressed(){
  generate(int(random(div)));
}
