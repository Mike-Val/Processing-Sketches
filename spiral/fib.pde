float fib(int p){
  float A = 0;
  float B = 1;
  float T = 0;
  for( int i = 1; i <= p; i++ ){
    T = A + B;
    A = B;
    B = T;
  }
  return T;
}