//int z=100;
//float[] ax=new float[z];
//float[] ay=new float[z];
//int size=400;
//void setup(){
//  pixelDensity(2);
//  size(400,400);
  
//}

//int k=0;
//int c=0;
//int t=1;

//void draw() {
  
//  if (mousePressed && mouseButton == LEFT){
  
//  background(0);
//  ax[k] = mouseX;
//  ay[k] = mouseY;
//  k = (k + 1) % z;
//  noFill();
//  strokeWeight(4);
//  stroke(255);
//  //beginShape();
//  for (int i = 0; i < z; i++) {
//    int pos = (k + i) % z;
//    ellipse(ax[pos], ay[pos], 4, 4);
//    vertex(ax[pos],ay[pos]);
//  }
//  //endShape();
//  c=c++;
//  if (c == ax.length) {
//    ax=expand(ax);
//    ay=expand(ay);
//  };
//  };
  
//  if (mousePressed && mouseButton == RIGHT){
//    for (int i=0; i<ax.length; i++){
//      ay[i]=ay[i]+(9.8*3*3);
//      t=t++;
//    }
//  }
//}