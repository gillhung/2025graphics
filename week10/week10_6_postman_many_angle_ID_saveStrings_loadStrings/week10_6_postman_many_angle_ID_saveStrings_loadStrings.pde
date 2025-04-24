// week10_6_postman_many_angle_ID_saveStrings_loadStrings
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
  
  if(key == 's'){ // 從這裡開始，每次按's'，就存一組 angle
    String now = ""; // 要放現在全部的關節的值
    for(int i=0; i<20; i++){ // 利用 for 迴圈
      now += angle[i] + " " ; // 全部塞到 now 裡， 記得有空格
    }
    lines.add(now); // 把現在的這行，加到 lines 裡
    String[] arr = new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angles.txt",arr);
  }
  
  if(key == 'r'){ // replay，照著之前按's'存檔的 lines 重播一次
    if(R<lines.size()){
      float[] now = float(split(lines.get(R),' '));
      for(int i=0;i<20;i++) angle[i] = now[i];
      R = (R+1) % lines.size();
    }
  }
}
int R = 0;
ArrayList<String> lines = new ArrayList<String>(); // ArrayList 資料結構

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
