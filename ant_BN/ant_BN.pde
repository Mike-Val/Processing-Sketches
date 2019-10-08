color w = color(255, 255, 255);
color b = color(0, 0, 255);
int x, y;

PVector ant;
PVector t;
int[][][] grid;

void setup() {
  size(808, 808);
  //pixelDensity(2);
  int d = 231;
  grid = new int[d][d][1];

  x = (grid.length-1)/2+1;
  y = (grid.length-1)/2+1;

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid.length; j++) {
      grid[i][j][0]=0;
    }
  }
}


int dir = 3;



void draw() {
  background(100);
  println(x, y, grid[x][y][0], dir);

  

    float D = width/grid.length;
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid.length; j++) {
        noStroke();
        if (grid[i][j][0] == 0) {
          fill(w);
        }
        if (grid[i][j][0] == 1) {
          fill(0);
        }

        strokeWeight(1);
        rect(i*D+1, j*D+1, D-1, D-1);

        fill(255, 0, 255);
        rect(x*D-2, y*D-2, D+2, D+2);
        //point((i*D+1+D-2)/2, (j*D+1+D-2)/2);
      }
    }
    
    for (int k = 0; k < 1000; k++) {


    if (dir == 0) {
      //grid[x][y][0] = 0;
      if (y == 0) {
        y=grid.length-1;
      } else {
        y--;
      }
    }
    if (dir == 1) {
      //grid[x][y][0] = 1;
      if (x == grid.length-1) {
        x=0;
      } else {
        x++;
      }
    }
    if (dir == 2) {
      //grid[x][y][0] = 3;
      if (y == grid.length-1) {
        y=0;
      } else {
        y++;
      }
    }
    if (dir == 3) {
      //grid[x][y][0] = 2;
      if (x == 0) {
        x=grid.length-1;
      } else {
        x--;
      }
    }
    
    
    
    if (grid[x][y][0] == 0) {
      grid[x][y][0] = 1;
      dir++;
    } else if (grid[x][y][0] == 1) {
      grid[x][y][0] = 0;
      dir = dir -1;
    }
    if (dir > 3) {
      dir = dir - 4;
    }
    if (dir < 0) {
      dir = 4 + dir;
    }
  }
}