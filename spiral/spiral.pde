void setup(){
  size(1000, 1000);
  pixelDensity(2);
  frameRate(10);
}

void draw(){
  background(25);
  int n;
  noFill();
  stroke(255);
  int f=0;
  int t=0;
  n = 30;
  int k;
  int q=10;
  int x=0;
  for (int i=0; i<n; i=i+1){
    t=t+i;
    strokeWeight(1);
    f=t;
    x=t;
    k=parseInt(map(f, 0, n, 0, 255));
    stroke(random(map(x, 0, x, 1, 3))*map(noise(x+0.05)*10, 0, noise(x+0.05)*10, 0, 255), random(map(x, 0, x, 1, 3))*map(noise(x+0.1)*10, 0, noise(x+0.1)*10, 0, 255), random(map(x, 0, x, 1, 3))*map(noise(x+0.15)*10, 0, noise(x+0.15)*10, 0, 255));
    //stroke(map(parseFloat(k*parseInt(random(q+random(1, 5)))), 0, k*q-1, 0, 255), map(parseFloat(k*parseInt(random(q+random(1, 5)))), 0, k*q-1, 0, 255), map(parseFloat(k*parseInt(random(q+random(1, 5)))), 0, k*q-1, 0, 255));
    arc(height/2, width/2, fib(i)/100, fib(i)/100, radians(270+f), radians(360+f));
    //line(200, 200, 400, 400);
  }
}