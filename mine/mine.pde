cells[] v;
int[] uc;
int[] p;

int l = 35;
int L = l*l;
int d = 1;

int t;
int b = 0;
int fl = 0;
int cs;

// 0 = casella coperta   1 = casella scoperta   2 = bomba coperta   3 = bomba scoperta   4 = flag
void setup() {
  frameRate(5);
  pixelDensity(2);
  size(700, 700);
  v = new cells[L];
  uc = new int[int(L*.1*d)];
  p = new int[L];
  for (int i = 0; i < l; i++) {
    for (int j = 0; j < l; j++) {
      v[i*l+j] = new cells(j*((width-50)/l)+25, i*((height-50)/l)+25, 0);
    }
  }
  int t;

  for (int i = 0; i < int(L*0.1*d); i++) {
    do {
      t = int(random(L));
    } while (check(t));
    uc[i] = t;
    v[t].s = 2;
  }

  for (int i = 0; i < l; i++) {
    for (int j = 0; j < l; j++) {
      v[i*l+j].check(j, i);
      //println(j, i, v[i*l+j].s, v[i*l+j].ngh);
    }
  }

  //println(v.length, uc.length);
  
  for (int i = 0; i < L; i++){
    p[i] = v[i].s;
    if (v[i].s == 2)
      b++;
  }
}

void draw() {
  colorMode(HSB);
  background(0);
  stroke(255);
  strokeWeight(2);
  textAlign(CENTER);
  textSize((width/l)*0.7);
  
  cs = 0;
  for (int i = 0; i < L; i++){
    if (v[i].s == 1)
      cs++;
  }

  for (int i = 0; i < L; i++) {
    if (v[i].s > 1) {
      fill(0, 0, 122);
      if (v[i].s == 3)
        fill(0, 255, 255);
      if (v[i].s == 4)
        fill (40, 255, 255);
      rect(v[i].x, v[i].y, (width/l), (height/l));
      fill(0, 0, 0);
      //switch commented and not to enable/disable text
      //if (v[i].s == 3 || v[i].s == 2)
      if (v[i].s == 3)
        text("B", v[i].x+((width/l)/2), v[i].y+((height/l)/1.4));
      if (v[i].s == 4)
        text("F", v[i].x+((width/l)/2), v[i].y+((height/l)/1.4));
    }
    
    if (v[i].ngh >= 0 && v[i].s < 2) {
      fill(0, 0, 122);
      if (v[i].ngh == 0 && v[i].s == 1)
        fill(40, 0, 255);
      if (v[i].ngh > 0 && v[i].s == 1)
        fill(map(v[i].ngh, 1, 8, 90, 230), 255, 255);
      rect(v[i].x, v[i].y, (width/l), (height/l));
      fill(0, 0, 0);
      //comment under to show numbers
      if (v[i].s == 1)
        text(v[i].ngh, v[i].x+((width/l)/2), v[i].y+((height/l)/1.4));
    }
    //strokeWeight(10);
    //stroke(0, 255, 255);
    //point(v[i].x, v[i].y);
    //strokeWeight(2);
    //stroke(255);

    if (mouseX > v[i].x && mouseX < v[i].x+(width/l) && mouseY > v[i].y && mouseY < v[i].y+(height/l)) {
      t = i;
      
      if (keyPressed && key == 'f'){
        if (v[t].s != 4){
          v[i].s = 4;
          fl++;
        }
        else if (v[t].s == 4){
           v[i].s = p[i];
           fl--;
        }
      }
      
      //strokeWeight(10);
      //fill(0);
      //point(mouseX, mouseY);
      //strokeWeight(2);
    }

    if (v[i].s == 3){
      //strokeWeight(3);
      //stroke(255);
      fill(0);
      //rect(0, 0, width, height);
      fill(0, 255, 255);
      textSize(30);
      text("Game Over", width/2, height/2);
      textSize((width/l)*0.7);
      //break;
    }
    
    if (fl == b && cs == L-b){
      fill(255);
      rect(0, 0, width, height);
      fill(180, 255, 255);
      textSize(30);
      text("You Win", width/2, height/2);
      break;
    }
  }
  //<println(L, b, fl, cs);
}


boolean check(float n) {
  for (int i = 0; i < uc.length; i++) {
    if (n == uc[i]) {
      return true;
    }
  }
  return false;
}

void mouseClicked() {
  if (v[t].s == 2 && v[t].s != 4)
    v[t].s = 3;
  if (v[t].s == 0 && v[t].s != 4)
    v[t].s = 1;

  if (v[t].ngh == 0 && v[t].s != 4) {
    clear(t);
  }
}

void clear(int f) {
  v[f].s = 1;

  if ((f-l+1)%l!=0 || f!=l-1 || f==0) {
    if (f!=L-1 && v[f+1].ngh == 0 && v[f+1].s == 0 && v[f+1].s != 2 && (f-l+1)%l!=0) {
      v[f+1].s = 1;
      clear(f+1);
    }
    if (f!=L-1 && v[f+1].ngh > 0 && v[f+1].s == 0 && (f-l+1)%l!=0)
      v[f+1].s = 1;
  }

  if (f%(l)!=0) {
    if (v[f-1].ngh == 0 && v[f-1].s == 0 && v[f-1].s != 2) {
      v[f-1].s = 1;
      clear(f-1);
    }
    if (v[f-1].ngh > 0)
      v[f-1].s = 1;
  }

  if (((L-1)-f)>l-1) {
    if (v[f+l].ngh == 0 && v[f+l].s == 0 && v[f+l].s != 2) {
      v[f+l].s = 1;
      clear(f+l);
    }
    if (v[f+l].ngh > 0)
      v[f+l].s = 1;
  }

  if (f>l-1 ) {
    if (v[f-l].ngh == 0 && v[f-l].s == 0 && v[f-l].s != 2) {
      v[f-l].s = 1;
      clear(f-l);
    }
    if (v[f-l].ngh > 0)
      v[f-l].s = 1;
  }
}