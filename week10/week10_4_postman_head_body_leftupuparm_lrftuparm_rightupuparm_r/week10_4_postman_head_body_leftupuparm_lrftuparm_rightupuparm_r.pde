// week10_4_postman_head_body_leftupuparm_lrftuparm_rightupuparm_rightuparm_push_trt_pop
PImage postman, head, body, leftupuparm, leftuparm, rightupuparm, rightuparm;
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
    rotate(radians(mouseX));
    translate(-236,-231); // 把頭的旋轉中心，放到(0,0)
    image(head, 0, 0); // 再畫我們的頭
  popMatrix();
  
  pushMatrix();
    translate(+185, +263); // 再放回去正確的位置
    //rotate(radians(mouseX));
    translate(-185,-263); 
    image(leftupuparm, 0, 0);  // 左上上手臂
    pushMatrix();
      translate(+118, +264); // 再放回去正確的位置
      //rotate(radians(mouseX));
      translate(-118,-264); 
      image(leftuparm, 0, 0);  // 左上手臂
    popMatrix();
  popMatrix();
  
  pushMatrix();
    translate(+290, +263); // 再放回去正確的位置
    rotate(radians(mouseX));
    translate(-290,-263); 
    image(rightupuparm, 0, 0);  // 右上上手臂
    pushMatrix();
      translate(+356, +259); // 再放回去正確的位置
      rotate(radians(mouseX));
      translate(-356,-259); 
      image(rightuparm, 0, 0);  // 右上手臂
    popMatrix();
  popMatrix();

  image(body, 0, 0); // 再畫身體 
}
