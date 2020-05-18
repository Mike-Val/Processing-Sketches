import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class dither extends PApplet {

PImage img;
int possibleColors = 4;

public void settings() {
    selectInput("Select a file to process:", "fileSelected");
    while (img == null)  delay(100);
    size(img.width*2, img.height);
}

public void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    img = loadImage(selection.getAbsolutePath());
  }
}

public void setup() {
    // img.filter(GRAY);
    image(img, 0, 0);
}

public void draw() {
    img.loadPixels();
    for (int y = 0; y < img.height-1; y++) {
        for (int x = 0; x < img.width-1; x++) {
            int oldpixel = img.pixels[map(x, y)];
            int newpixel = closestColor(oldpixel);
            img.pixels[map(x, y)] = newpixel;

            float[] quant_error = getError(oldpixel, newpixel);
            img.pixels[map(x+1, y  )] = addError(img.pixels[map(x+1, y  )], quant_error, (7.0f / 16.0f));
            img.pixels[map(x-1, y+1)] = addError(img.pixels[map(x-1, y+1)], quant_error, (3.0f / 16.0f));
            img.pixels[map(x  , y+1)] = addError(img.pixels[map(x  , y+1)], quant_error, (5.0f / 16.0f));
            img.pixels[map(x+1, y+1)] = addError(img.pixels[map(x+1, y+1)], quant_error, (1.0f / 16.0f));
        }
    }
    img.updatePixels();
    // save("scaledGatto.jpg");
    image(img, img.width, 0);
    noLoop();
}

public int map(int x ,int y) {
    return y*img.width+x;
}

public int closestColor(int old) {
    return color(scaleColor(red(old)), scaleColor(green(old)), scaleColor(blue(old)));
}

public int scaleColor(float i) {
    return PApplet.parseInt(possibleColors * i / 255) * (255 / possibleColors);
}

public float[] getError(int oldpixel, int newpixel) {
    return new float[] {red(oldpixel)-red(newpixel), green(oldpixel)-green(newpixel), blue(oldpixel)-blue(newpixel)};
}

public int addError(int c, float[] err, float scale) {
    float r = constrain(PApplet.parseInt(red(c) + err[0] * scale), 0, 255);
    float g = constrain(PApplet.parseInt(green(c) + err[1] * scale), 0, 255);
    float b = constrain(PApplet.parseInt(blue(c) + err[2] * scale), 0, 255);
    return color(r, g, b);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "dither" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
