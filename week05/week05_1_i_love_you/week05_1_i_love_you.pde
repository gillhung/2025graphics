// week05_1_i_love_you
size(300,300); // 大小 300x300
stroke(255,0,0); // 筆觸，顏色:紅色
for(int xx=0;xx<300;xx++){ // 大的x 0...300
  for(int yy=0;yy<300;yy++){ // 大的y 0...300
    float x = (xx-150)/100.0; // 減一半、除100
    float y = -(yy-150)/100.0; // 減一半、除100
      // 0...300變 -150...+150變 -1.5 ~ +1.5
    float d = x*x + y*y -1;
    if( d*d*d - x*x*y*y*y < 0) point(xx,yy); // ==0 的線太細了，所以改<0
  }
}
