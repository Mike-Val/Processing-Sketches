PImage img;
int possibleColors = 4;

void settings() {
    selectInput("Select a file to process:", "fileSelected");
    while (img == null)  delay(100);
    size(img.width*2, img.height);
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    img = loadImage(selection.getAbsolutePath());
  }
}

void setup() {
    // img.filter(GRAY);
    image(img, 0, 0);
}

void draw() {
    img.loadPixels();
    for (int y = 0; y < img.height-1; y++) {
        for (int x = 0; x < img.width-1; x++) {
            color oldpixel = img.pixels[map(x, y)];
            color newpixel = closestColor(oldpixel);
            img.pixels[map(x, y)] = newpixel;

            float[] quant_error = getError(oldpixel, newpixel);
            img.pixels[map(x+1, y  )] = addError(img.pixels[map(x+1, y  )], quant_error, (7.0 / 16.0));
            img.pixels[map(x-1, y+1)] = addError(img.pixels[map(x-1, y+1)], quant_error, (3.0 / 16.0));
            img.pixels[map(x  , y+1)] = addError(img.pixels[map(x  , y+1)], quant_error, (5.0 / 16.0));
            img.pixels[map(x+1, y+1)] = addError(img.pixels[map(x+1, y+1)], quant_error, (1.0 / 16.0));
        }
    }
    img.updatePixels();
    // save("scaledGatto.jpg");
    image(img, img.width, 0);
    noLoop();
}

int map(int x ,int y) {
    return y*img.width+x;
}

color closestColor(color old) {
    return color(scaleColor(red(old)), scaleColor(green(old)), scaleColor(blue(old)));
}

int scaleColor(float i) {
    return int(possibleColors * i / 255) * (255 / possibleColors);
}

float[] getError(color oldpixel, color newpixel) {
    return new float[] {red(oldpixel)-red(newpixel), green(oldpixel)-green(newpixel), blue(oldpixel)-blue(newpixel)};
}

color addError(color c, float[] err, float scale) {
    float r = constrain(int(red(c) + err[0] * scale), 0, 255);
    float g = constrain(int(green(c) + err[1] * scale), 0, 255);
    float b = constrain(int(blue(c) + err[2] * scale), 0, 255);
    return color(r, g, b);
}
