void clock(float x, float y){
  
    noFill();
    stroke(255);
    strokeWeight(10);
    ellipse(x, y, 200, 200);
      
    float s = second();
    float m = minute();
    float h = hour();
    float hr = map(h, 0, 24, 0, 360);
    float mn = map(m, 0, 60, 0, 360);
    float sc = map(s, 0, 60, 0, 360);
    
    //sec
    noFill();
    stroke(170, 220, 70);
    strokeWeight(5);
    arc(x, y, 160, 160, -PI/2, radians(sc-90));
    pushMatrix();
    stroke(170, 220, 70);
    strokeWeight(5);
    line(x, y, x+170*cos(radians(sc-90)), y+170*sin(radians(sc-90)) );
    popMatrix();
    
    //min
    noFill();
    stroke(80, 100, 230);
    strokeWeight(5);
    arc(x, y, 130, 130, -PI/2, radians(mn-90));
    pushMatrix();
    stroke(80, 100, 230);
    strokeWeight(5);
    line(x, y, x+150*cos(radians(mn-90)), y+150*sin(radians(mn-90)) );
    popMatrix();
    
    //hrs
    noFill();
    stroke(230, 110, 70);
    strokeWeight(5);
    arc(x, y, 100, 100, -PI/2, radians(hr-90));
    pushMatrix();
    stroke(230, 110, 70);
    strokeWeight(5);
    line(x, y, x+120*cos(radians(hr-90)), y+120*sin(radians(hr-90)) );
    popMatrix();
    
    stroke(255, 255, 255);
    strokeWeight(20);
    line(x, y, x, y);
    
}