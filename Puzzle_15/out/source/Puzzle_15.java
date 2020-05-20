import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.io.File; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Puzzle_15 extends PApplet {



int puzzleSideSquare = 8;
ArrayList<Square> puzzle;
PImage image;
int xShift;
int yShift;
int toScramble = 250 * puzzleSideSquare * puzzleSideSquare;

boolean offline = true;

public void settings() {
  image = getImg();
  size(image.width * 2, image.height);
}

public PImage getImg() {
  PImage img = null;
  PImage res = null;
  if (offline) {
    img = loadImage(PApplet.parseInt(random(4)) + ".jpg").resize(500, 500);
  } else {
    img = download();
  } 
  while(true) {
    try {
      if (img.width > img.height) {
        res = img.get(PApplet.parseInt((img.width - img.height) / 2.0f), 0, img.height + PApplet.parseInt((img.width - img.height) / 2.0f), img.height);
      }else if (img.width < img.height) {
        res = img.get(0, PApplet.parseInt((img.height - img.width) / 2.0f), img.width, img.width + PApplet.parseInt((img.height - img.width) / 2.0f));
      }
      res.resize(500, 500);
      break;
    } catch (Exception e) {
      img = download();
    }
  }
  File tdT = sketchFile("toDownload.txt");
  if (tdT.exists()) {
    tdT.delete();
  }
  File tdI = sketchFile("downloadedImg.jpg");
  if (tdI.exists()) {
    tdI.delete();
  }
  File tdIe = sketchFile("downloadedImg.jpeg");
  if (tdIe.exists()) {
    tdIe.delete();
  }
  //println(res.width, res.height);
  return res;
}

public PImage download() {
  String url = "https://cdn.nekos.life/lewd/lewd_neko"+PApplet.parseInt(random(500))+".jpeg";

  File tdT = sketchFile("toDownload.txt");
  if (tdT.exists()) {
    tdT.delete();
  }
  File tdI = sketchFile("downloadedImg.jpg");
  if (tdI.exists()) {
    tdI.delete();
  }
  
  saveStrings("toDownload.txt", new String[] {url, sketchPath("")});

  StringList output = new StringList();
  StringList errors = new StringList();
  shell(output, errors, "/usr/bin/python3", sketchPath("downloadImg.py"), "<", sketchPath("toDownload.txt"));
  println("The process returned " + output.toString());
  println("The errors were " + errors.toString());

  tdI = sketchFile("downloadedImg.jpg");
  while(!tdI.exists()) {
    delay(100);
  }
  return loadImage("downloadedImg.jpg");
}


public void setup() {
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

public void draw() {
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

public int index(int x, int y) {
  return y * puzzleSideSquare + x;
}

public void mouseClicked() {
  if (toScramble == 0) {
    moveSquare(mouseX, mouseY);
  }
}

public void moveSquare(int x, int y) {
  Square subject = findSquare(x, y);
  if (subject != null) {
    subject.move(puzzle);
  }
}

public Square findSquare(float x, float y) {
  for(Square s : puzzle) {
    if (s.contains(x, y))
      return s;
  }
  return null;
}

public void scramble() {
  int emptyX = xShift * puzzleSideSquare - 1 + (xShift / 2);
  int emptyY = yShift * puzzleSideSquare - 1 + (yShift / 2);

  int newX;
  int newY;
  Square subject = findSquare(emptyX, emptyY);

  while (subject == null)  {
    newX = PApplet.parseInt(random(width));
    newY = PApplet.parseInt(random(height));
    subject = findSquare(newX, newY);
    if (subject != null && subject.canMove(puzzle)) {
      subject.move(puzzle);
      break;
    }
  }
  
}
public class Square {

    int x;
    int y;
    int w;
    int h;
    PImage img;

    public Square (PImage ref, int x, int y, int w, int h) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        
        img = createImage(w, h, RGB);
        // ref.loadPixels();
        // img.loadPixels();
        
        img = ref.get(x, y, w, h);
        // for (int j = y; j < y + h; j++) {
        //     for (int i = x; i < x + w; i++) {
        //         img.pixels[this.index(i - x, j - y, img)] = ref.pixels[this.index(i, j, ref)];
        //     }
        // }
        // img.updatePixels();
    }

    public void show() {
        image(img, x, y, w, h);
        stroke(0);
        strokeWeight(1);
        noFill();
        rect(x, y, w, h);
    }

    public void move(ArrayList<Square> puzzle) {
        int freeX = this.x;
        int freeY = this.y;
        for (int j = 0; j < puzzleSideSquare; j++) {
            for (int i = 0; i < puzzleSideSquare; i++) {
                boolean occupied = false;
                for (Square s : puzzle) {
                    if (s.contains((i * w) + w / 2, (j * h) + h / 2)) {
                        occupied = true;
                    }
                }
                if (!occupied) {
                    freeX = i * w;
                    freeY = j * h;
                }
            }
        }
        if (abs(x - freeX) == w && y == freeY) {
            moveTo(freeX, freeY);
        } else if (x == freeX && abs(y - freeY) == h) {
            moveTo(freeX, freeY);
        }   
    }

    public boolean canMove(ArrayList<Square> puzzle) {
        int freeX = this.x;
        int freeY = this.y;
        for (int j = 0; j < puzzleSideSquare; j++) {
            for (int i = 0; i < puzzleSideSquare; i++) {
                boolean occupied = false;
                for (Square s : puzzle) {
                    if (s.contains((i * w) + w / 2, (j * h) + h / 2)) {
                        occupied = true;
                    }
                }
                if (!occupied) {
                    freeX = i * w;
                    freeY = j * h;
                }
            }
        }
        if (abs(x - freeX) == w && y == freeY) {
            return true;
        } else if (x == freeX && abs(y - freeY) == h) {
            return true;
        }
        return false;
    }

    private int index(int x, int y, PImage ref) {
        return y * ref.width + x;
    }

    public void moveTo(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public boolean contains(float x, float y) {
        return (this.x <= x && x < this.x + this.w && this.y <= y && y < this.y + this.h); 
    }

    public void exchange(Square other) {
        int tmpX = this.x;
        this.x = other.x;
        other.x = tmpX;

        int tmpY = this.y;
        this.y = other.y;
        other.y = tmpY;
    }

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Puzzle_15" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
