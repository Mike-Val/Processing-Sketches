sqr[] grid;
int l = 7;
int L = l*l;
float h = 10;


void setup() {
  size(600, 600);
  pixelDensity(2);
  grid = new sqr[L];
  //println(grid.length);

  for (int i = 0; i < l; i++) {
    for (int j = 0; j < l; j++) {
      //println(i, j, i*l+j);
      grid[i*l+j] = new sqr(j*h-(l*h/2), i*h-(l*h/2));
    }
  }
}
float sf;
void draw() {
  background(0);
  translate(width/2, height/2);
  sf = map(mouseY, -1, 1, 10, .01);
  //scale(sf);
  scale(5);
  stroke(255);

  int t = 0;
  textSize(3);
  textAlign(CENTER);
  for (sqr i : grid) {
    fill(0);
    if (i.s == 1)
      fill(255, 0, 0);
    rect(i.x, i.y, h, h);
    fill(255);
    text(t, i.x+l/2, i.y+l/2);
    i.check(t);
    t++;
    float mx = map(mouseX, 0, width, -width/2, width/2);
    float my = map(mouseY, 0, height, -height/2, height/2);
      //println(mx, my);
    if (mx >= i.x && mx <= i.x+h && my >= i.y && my <= i.y+h){
      
      if (i.s == 0){
        i.s = 1;
      }
      else{
        i.s = 0;
      }
    }
  }
  ellipse(0, 0, 10, 10);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  //println(e);
}
