// week05_1b_i_love_you
size(300,300); // 大小 300x300
stroke(255,0,0); // 筆觸，顏色:紅色
translate(width/2, height/2);  // translate(150,150);
for(int xx=-150;xx<150;xx++){ // 大的x -150 ~ +150
  for(int yy=-150;yy<150;yy++){ // 大的y -150 ~ +150
    float x = xx/100.0; // 減一半、除100
    float y = -yy/100.0; // 減一半、除100
      // 0...300變 -150...+150變 -1.5 ~ +1.5
    float d = x*x + y*y -1;
    if( d*d*d - x*x*y*y*y < 0) point(xx,yy); // ==0 的線太細了，所以改<0
  }
}
