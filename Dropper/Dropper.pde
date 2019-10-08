player p = new player();
drop[] drops = new drop[10];
int score = 0;
float newVel = 0;

void setup(){
  pixelDensity(2);
  size(800, 600);
  frameRate(100);
  for (int i = 0; i < drops.length; i++){
    drops[i] = new drop(int(random(width-40)+20));
  }
}

void draw(){
  background(0);
  p.show();
  p.update();
  text(frameRate, width/2, 10);
  String scorecount = "Score: " + str(score);
  text(scorecount, 20, 20);
  text(drops[0].vel, width-100, 10);
  
  int oldScore = score;
  
  for (int i = 0; i < drops.length; i++){
    drops[i].check(p);
    drops[i].update();
    drops[i].show();
  }
  
  for (drop d : drops){
    if (score > oldScore){
      d.vel = map(score, 0, 100, 5, 15);
    } 
  }
}
