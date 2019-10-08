class drop {
  PVector pos = new PVector();
  int w = 20;
  int h = 5;
  int timer;
  int timerInit;
  float vel = 5;

  drop(int x) {
    pos.x = x;
    pos.y = -h;
    timerInit = int(random(1000));
    timer = timerInit;
    update();
  }

  void update() {
    if (timer > 0) {
      timer--;
    } else {
      pos.y += vel;
      if (pos.y > height+h) {
        reset();
      }
    }
  }

  void reset() {
    pos.x = int(random(width-40)+20);
    pos.y = -random(height);
    timer = timerInit;
  }
  void show() {
    stroke(255);
    rectMode(CENTER);
    rect(pos.x, pos.y, w, h);
  }
  
  void check(player p){
    if (pos.x>=p.pos.x-((p.w+w)/2.5) && pos.x<=p.pos.x+((p.w+w)/2.5) && pos.y >= height-30){
      reset();
      score++;
    }
  }
}
