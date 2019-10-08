class piece { //<>//
  int x, y;
  color c;
  char um;

  piece (int xc, int yc) {
    x = xc;
    y = yc;
    c = color(150);
    um = 'n';
  }

  void show() {
    fill(c);
    square(x*size, y*size, size);
  }

  void move() {
    if (um == 'w') {
      y--;
    }
    if (um == 's') {
      y++;
    }
    if (um == 'a') {
      x--;
    }
    if (um == 'd') {
      x++;
    }
    if (x < 0)
      x += N;
    if (x > N-1)
      x -= N;
    if (y < 0)
      y += N;
    if (y > N-1)
      y -= N;
  }
}
