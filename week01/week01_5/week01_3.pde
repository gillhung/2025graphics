// week01-5_Java_OpenGL_setup_draw_rotate
void setup(){
  size(400,400,P3D); // 設定好全部的 OpenGL
}
float angle = 0;
void draw(){
  background(0); // 背景清掉，才能正確的畫新的內容
  translate(200,200); // 把東西，往200,200位移
  rotate(angle); // 在座標 0,0 轉動
  angle+=0.01;
  beginShape(TRIANGLES); 
  fill(255,0,0);vertex(0,100*2); // 照著 CodeBlock 的大小比例縮放
  fill(0,255,0);vertex(87*2,-50*2);
  fill(0,0,255);vertex(-87*2,-50*2);
  endShape();
}
