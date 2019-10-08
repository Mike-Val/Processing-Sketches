class player{
  PVector pos;
  int w = 80;
  int h = 10;
  
  player(){
    pos = new PVector();
  }
  
  void show(){
    stroke(255);
    rectMode(CENTER);
    pushMatrix();
    translate(0, height-30);
    rect(pos.x, pos.y, w, h);
    //line(pos.x-(w/2), pos.y, pos.x-(w/2), -height);
    //line(pos.x+(w/2), pos.y, pos.x+(w/2), -height);
    popMatrix();
  }
  
  void update(){
    pos.x = map(mouseX, -20, width+20, 10, width-(10));
  }
}
