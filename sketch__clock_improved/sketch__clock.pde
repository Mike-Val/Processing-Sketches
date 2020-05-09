
void setup(){
  //size(800, 800);
  fullScreen(); //1080p screen.
}

void draw(){
  // Background color not 100% black.
  background(25);
  // Get mouse x and y positions and make sure the displayed clock does not go partially outside the window.
  float x = map(mouseX, 0, width, 105, width-105);
  float y = map(mouseY, 0, height, 105, height-105);
  
  // Draw outer circle of the clock as white with a linewidth of 10.
  noFill();
  stroke(255);
  strokeWeight(10);
  ellipse(x, y, 200, 200);
    
  // Get the hours, minutes and seconds from the system time.
  // Convert them to an angle in degrees.
  float seconds = (second() * TWO_PI)/60 - PI/2;
  float minutes = ((minute() * TWO_PI)/60 - PI/2); // + seconds/60;
  float hours = (((hour() * TWO_PI)/12 - PI/2) % TWO_PI); // + minutes/60;
  
  strokeWeight(5);
  // Draw the seconds.
  stroke(170, 220, 70);
  arc(x, y, 160, 160, -PI/2, seconds);
  line(x, y, x+170*cos(seconds), y+170*sin(seconds));
  
  // Draw the minutes.
  stroke(80, 100, 230);
  arc(x, y, 130, 130, -PI/2, minutes);
  line(x, y, x+150*cos(minutes), y+150*sin(minutes));
  
  // Draw the hours.
  stroke(230, 110, 70);
  arc(x, y, 100, 100, -PI/2, hours);
  line(x, y, x+120*cos(hours), y+120*sin(hours));
  
  // Draw a point in the middle.
  stroke(255);
  strokeWeight(20);
  point(x, y);

}
