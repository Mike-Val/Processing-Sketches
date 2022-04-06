import java.io.File;

int puzzleSideSquare = 8;
ArrayList<Square> puzzle;
PImage image;
int xShift;
int yShift;
int toScramble = 250 * puzzleSideSquare * puzzleSideSquare;

boolean offline = false;

void settings() {
  image = getImg();
  size(image.width * 2, image.height);
}

PImage getImg() {
  PImage img = offline ? loadImage(int(random(6)+1) + ".jpg") : download();
  PImage res = null;
  
  if (img.width > img.height) {
    res = img.get(int((img.width - img.height) / 2.0), 0, img.height + int((img.width - img.height) / 2.0), img.height);
  } else {
    res = img.get(0, int((img.height - img.width) / 2.0), img.width, img.width + int((img.height - img.width) / 2.0));
  }
  res.resize(500, 500);
  
  File tdI = sketchFile("downloadedImg.jpg");
  if (tdI.exists()) {
    tdI.delete();
  }
  
  return res;
}

PImage download() {
  StringList output = new StringList();
  StringList errors = new StringList();
  shell(output, errors, "/usr/bin/python3", sketchPath("downloadImg.py"), sketchPath(""));
  println("The process returned " + output.toString());
  println("The errors were " + errors.toString());

  return loadImage("downloadedImg.jpg");
}


void setup() {
  puzzle = new ArrayList<Square>();
  xShift = image.width / puzzleSideSquare;
  yShift = image.height / puzzleSideSquare;
  
  for (int y = 0; y < puzzleSideSquare; y++) {
    for (int x = 0; x < puzzleSideSquare; x++) {
      puzzle.add(new Square(image, x * xShift, y * yShift, xShift, yShift)); 
    }
  }
  puzzle.remove(puzzle.size() - 1);

  //while (toScramble > 0) {
  //  scramble();
  //  toScramble--;
  //}
}

void draw() {
  background(0);
  
  image(image, image.width, 0, image.width, image.height);

  for(Square s : puzzle) {
    s.show();
  }
  for (int k = 0; k < 100; k++) { 
   if (toScramble > 0) {
     scramble(); 
     toScramble--;
   }
  }
}

int index(int x, int y) {
  return y * puzzleSideSquare + x;
}

void mouseClicked() {
  if (toScramble == 0) {
    moveSquare(mouseX, mouseY);
  }
}

void moveSquare(int x, int y) {
  Square subject = findSquare(x, y);
  if (subject != null) {
    subject.move(puzzle);
  }
}

Square findSquare(float x, float y) {
  for(Square s : puzzle) {
    if (s.contains(x, y))
      return s;
  }
  return null;
}

void scramble() {
  int emptyX = xShift * puzzleSideSquare - 1 + (xShift / 2);
  int emptyY = yShift * puzzleSideSquare - 1 + (yShift / 2);

  int newX;
  int newY;
  Square subject = findSquare(emptyX, emptyY);

  while (subject == null)  {
    newX = int(random(width));
    newY = int(random(height));
    subject = findSquare(newX, newY);
    if (subject != null && subject.canMove(puzzle)) {
      subject.move(puzzle);
      break;
    }
  }
  
}
