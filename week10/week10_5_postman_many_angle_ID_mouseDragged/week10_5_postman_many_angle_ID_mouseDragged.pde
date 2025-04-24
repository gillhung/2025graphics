// week10_5_postman_many_angle_ID_mouseDragged
PImage postman, head, body, leftupuparm, leftuparm, rightupuparm, rightuparm;
float[] angle = new float[20]; // 準備20個關節的變數
int ID = 0; // 現在要處理的關節 ID (第幾個關節)

void mouseDragged(){
  angle[ID] += mouseX - pmouseX;
}

void keyPressed(){
  if(key == '1') ID = 1; // 左上上臂
  if(key == '2') ID = 2; // 左上臂
  if(key == '3') ID = 3; // 右上上臂
  if(key == '4') ID = 4; // 右上臂
  if(key == '5') ID = 5; // (待用)
  if(key == '6') ID = 6; // (待用)
  if(key == '0') ID = 0; // 頭
}
void setup(){
  size(560, 560);
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  leftupuparm = loadImage("leftupuparm.png");
  leftuparm = loadImage("leftuparm.png");
  rightupuparm = loadImage("rightupuparm.png");
  rightuparm = loadImage("rightuparm.png");
}

void draw(){
  background(#FFFFF2);
  image(postman, 0, 0); // 基礎的郵差先生
  fill(255, 0, 255, 128); // 半透明的紫色
  rect(0, 0, 560, 560); // 蓋上去
  
  pushMatrix();
    translate(+236, +231); // 再放回去正確的位置
    rotate(radians(angle[0]));
    translate(-236,-231); // 把頭的旋轉中心，放到(0,0)
    image(head, 0, 0); // 再畫我們的頭
  popMatrix();
  
  pushMatrix();
    translate(+185, +263); // 再放回去正確的位置
    rotate(radians(angle[1]));
    translate(-185,-263); 
    image(leftupuparm, 0, 0);  // 左上上手臂
    pushMatrix();
      translate(+118, +264); // 再放回去正確的位置
      rotate(radians(angle[2]));
      translate(-118,-264); 
      image(leftuparm, 0, 0);  // 左上手臂
    popMatrix();
  popMatrix();
  
  pushMatrix();
    translate(+290, +263); // 再放回去正確的位置
    rotate(radians(angle[3]));
    translate(-290,-263); 
    image(rightupuparm, 0, 0);  // 右上上手臂
    pushMatrix();
      translate(+356, +259); // 再放回去正確的位置
      rotate(radians(angle[4]));
      translate(-356,-259); 
      image(rightuparm, 0, 0);  // 右上手臂
    popMatrix();
  popMatrix();

  image(body, 0, 0); // 再畫身體 
}
