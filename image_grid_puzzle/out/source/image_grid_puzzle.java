import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.io.File; 
import java.util.Map; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class image_grid_puzzle extends PApplet {




class Color {
    public int c;

    Color(int c) {
        this.c = c;
    } 
}

HashMap<Color,String> map = new HashMap<Color,String>();


File[] image_files;
int final_resolution = 800;
PImage original;
int side = 100;
int num_images = side*side;
PImage[][] images = new PImage[side][side];

public void settings() {
    size(final_resolution*2, final_resolution);
    pixelDensity(2);
}

public void setup() {
    image_files = new File(sketchPath() + "/images").listFiles();
    // selectInput("Select a file to process:", "fileSelected");
    original = loadImage("/Users/mike/Git-Hub/Processing-Sketches/image_grid_puzzle/images/211.jpg");

    fill(255);
    textAlign(CENTER);
    textSize(32);
    // while (image_file_index < image_files.length && map.size() < num_images) {
    //     loadImages();
    // }

    if (original.width > original.height) {
        original.resize(0, height);
    } else {
        original.resize(width/2, 0);
    }
    original = original.get(0, 0, width/2, height);
    original.loadPixels();
}

int image_file_index = 0;
int img_size = final_resolution/side;
boolean loaded = false;
int x = 0;
int y = 0;
public void draw() {
    if (loaded && images[0][0] == null) {
        background(0);
    }
    if (!loaded) {
        background(0);
        loadImages();
    } else {
        for (int i = 0; i < side; i++) {
            image(original, 0, 0);
            if (x < side && y < side) {
                images[x][y] = makeImage(x, y);
                image(images[x][y], x*img_size+width/2, y*img_size);
            }
            x++;
            if (x >= side) {
                x = 0;
                y++;
            }
        }
    }
}

public PImage makeImage(int x, int y) {
    int a, r, g, b;
    a = r = g = b = 0;
    for (int py = y*img_size; py < (y+1)*img_size; py++) {
        for (int px = x*img_size; px < (x+1)*img_size; px++) {
            int c = original.pixels[px+py*original.width];
            a += (c >> 24) & 0xFF;
            r += (c >> 16) & 0xFF;
            g += (c >> 8) & 0xFF;
            b += c & 0xFF;
        }
    }
    int s = img_size*img_size;
    a /= s;
    r /= s;
    g /= s;
    b /= s;
    PImage nearest = find_nearest_image(new Color(color (r, g, b, a)));
    nearest.resize(img_size, img_size);
    return nearest;
}

public PImage find_nearest_image(Color c) {
    double record_dist = Math.pow(255, 2)+Math.pow(255, 2)+Math.pow(255, 2)+Math.pow(255, 2);
    int a, r, g, b;
    a = r = g = b = 0;
    a += (c.c >> 24) & 0xFF;
    r += (c.c >> 16) & 0xFF;
    g += (c.c >> 8) & 0xFF;
    b += c.c & 0xFF;
    Color record_color = null;
    for (Color k : map.keySet()) {
        int k_a, k_r, k_g, k_b;
        k_a = k_r = k_g = k_b = 0;
        int kolor = k.c;
        k_a += (kolor >> 24) & 0xFF;
        k_r += (kolor >> 16) & 0xFF;
        k_g += (kolor >> 8) & 0xFF;
        k_b += kolor & 0xFF;
        double dist =  Math.pow(a-k_a, 2) 
                    + Math.pow(r-k_r, 2) 
                    + Math.pow(g-k_g, 2) 
                    + Math.pow(b-k_b, 2);
        if (dist < record_dist) {
            record_dist = dist;
            record_color = k;
        }
    }
    return loadImage(map.remove(record_color));
}

public void selectInput(File selection) {
    if (selection != null) {
        original = loadImage(selection.getAbsolutePath());
    }
}

public void loadImages() {
    try {
        PImage img = loadImage(image_files[image_file_index++].getAbsolutePath());
        if (img.width <= 0 || img.width <= 0) {
            return;
        }
        int s = Math.min(img.width, img.height);
        img = img.get(0, 0, s, s);
        img.resize(img_size, img_size);
        img.loadPixels();
        int a, r, g, b;
        a = r = g = b = 0;
        s = img.width*img.height;
        for (int i = 0; i < s; i++) {
            int c = img.pixels[i];
            a += (c >> 24) & 0xFF;
            r += (c >> 16) & 0xFF;
            g += (c >> 8) & 0xFF;
            b += c & 0xFF;
        }
        a /= s;
        r /= s;
        g /= s;
        b /= s;
        map.put(new Color(color(r, g, b, a)), image_files[image_file_index-1].getAbsolutePath());
    } catch(Exception e) {
        background(0);
        text("Error", width/2, height/2);
        return;
    }
    loaded = map.size() == num_images;
    text(map.size(), width/2, height/2);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "image_grid_puzzle" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
