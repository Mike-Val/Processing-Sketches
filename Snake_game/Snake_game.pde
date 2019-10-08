Cell[] grid;
int N = 40;
float size;
int food = 0;
int maxFood = 2;
int foodI;
piece[] snake = new piece[1];
int points = 0;
float a = 0;

void setup() {
  pixelDensity(2);
  size(600, 600);

  snake[0] = new piece(int(random(0, N)), int(random(0, N)));
  snake[0].c = color(255, 0, 0);
  grid = new Cell[N*N];
  size = width / N;

  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      grid[index(j, i)] = new Cell(j, i);
    }
  }

  for (int i = 1; i < snake.length; i++) {
    snake[i] = new piece(snake[0].x, snake[0].y);
  }
}

void draw() {
  frameRate(6);
  background(0);
  strokeWeight(1);

  for (Cell cell : grid) {
    fill(255);
    if (cell.s == 1)
      fill(0, 255, 0);  
    square(cell.x*size, cell.y*size, size);
  }

  maxFood = int(3 * points) +1 ;
  genFood();

  if (grid[index(snake[0].x, snake[0].y)].s == 1) {
    food--;
    grid[index(snake[0].x, snake[0].y)].s = 0;
    eaten();
  }

  for (piece s : snake) {
    s.move();
    s.show();
  }

  for (int i = snake.length-1; i > 0; i--) {
    snake[i].um = snake[i-1].um;
    if (index(snake[i].x, snake[i].y) == index(snake[0].x, snake[0].y))
      exit();
  }

  colorMode(HSB);
  textSize(30);
  fill(a, 255, 255);
  text("Points: " + points, 30, 30);
  a+=5;
  colorMode(RGB);

  //strokeWeight(10);
  //point(snake[0].x*size+size/2, snake[0].y*size+size/2);
}

int index(int x, int y) {
  return x + y * N;
}

void genFood() {
  if (food < maxFood) {
    foodI = index(int(random(0, N)), int(random(0, N)));
    int si = index(snake[0].x, snake[0].y);
    if (foodI != si && grid[foodI].s == 0) {
      grid[foodI].s = 1;
      food++;;
    }
  }
}

void eaten() {
  snake = (piece[]) expand(snake, snake.length+1);
  int i = snake.length-1;
  snake[i] = new piece(snake[i-1].x, snake[i-1].y);
  points++;
}

void keyPressed() {
  if (key == 'w' && snake[0].um != 's')
    snake[0].um = key;
  else if (key == 's' && snake[0].um != 'w')
    snake[0].um = key;
  else if (key == 'a' && snake[0].um != 'd')
    snake[0].um = key;
  else if (key == 'd' && snake[0].um != 'a')
    snake[0].um = key;
}
