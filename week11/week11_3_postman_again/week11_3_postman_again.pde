// week11-3_postman_again
// 重新來一次，讓程式的架構變更清楚
PImage postman, head, body, leftupuparm, leftuparm, rightupuparm, rightuparm, foot1, foot2;
void setup(){
  size(560,560);
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  leftupuparm = loadImage("leftupuparm.png");
  leftuparm = loadImage("leftuparm.png");
  rightupuparm = loadImage("rightupuparm.png");
  rightuparm = loadImage("rightuparm.png");
  foot1 = loadImage("foot1.png");
  foot2 = loadImage("foot2.png");
}
int R = 0;
void myInterpolate(){
  if(lines.size() >= 2){ // 要有 2 行以上，才能做內插
    float alpha = (frameCount%30)/30.0; // 介於 0.0~1.0 中間的值
    if(alpha == 0.0) R = (R+1)%lines.size(); // 如果變到0.0，就換下一組
    int R2 = (R+1)%lines.size();
    float [] oldAngle = float(split( lines.get( R ),' '));
    float [] newAngle = float(split( lines.get( R2 ),' '));
    for(int i=0;i<10;i++){ 
      angleX[i] = oldAngle[i*2+0]*(1-alpha) + newAngle[i*2+0]*alpha;
      angleY[i] = oldAngle[i*2+1]*(1-alpha) + newAngle[i*2+1]*alpha;
    } 
  }   
}

float [] angleX = new float[10]; // 在 3D 的世界裡面，我們的旋轉
float [] angleY = new float[10];

int ID = 0; // 一開始是頭的關節
ArrayList<String> lines = new ArrayList<String>();
void keyPressed(){
  if(key == 's'){
    String now = ""; //空字串
    for(int i=0;i<10;i++){
      now += angleX[i] + " "; // 後面有空格
      now += angleY[i] + " "; // 後面有空格
    }
    lines.add(now); // 把現在的動作的這行，加到 lines 裡面
    String[] arr = new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angles.txt",arr);
    println("現在存檔:"+ now);
  } 
  if(key == 'r'){
    String [] file = loadStrings("angles.txt");
    if(file != null){
      for(int i=0; i<file.length; i++){
        lines.add(file[i]);
        println("現在讀檔:" + file[i]);
      }
    }
  }
  if(key == 'p') playing = !playing; // 播動畫 <=> 不播動畫
  if(key == '1') ID = 1; // 左上上臂
  if(key == '2') ID = 2; // 左上臂
  if(key == '3') ID = 3; // 右上上臂
  if(key == '4') ID = 4; // 右上臂
  if(key == '5') ID = 5; // (待用)
  if(key == '6') ID = 6; // (待用)
  if(key == '0') ID = 0; // 頭
}
boolean playing = false; // 一開始，不播動畫，按下 'p' 可切換

void mouseDragged(){
  angleX[ID] += mouseX - pmouseX;
  angleY[ID] += mouseY - pmouseY; // 多了這一行
}

void draw(){
  background(#FFFFF2);
  if(playing) myInterpolate();
  image(body, 0, 0); // 先畫身體
  
  pushMatrix();
    translate(+236, +231); // 再放回去正確的位置
    rotate(radians(angleX[0])); 
    translate(-236,-231); // 把頭的旋轉中心，放到(0,0)
    image(head, 0, 0); // 再畫頭
  popMatrix();
  
  pushMatrix();
    translate(+185, +263); // 再放回去正確的位置
    rotate(radians(angleX[1]));
    translate(-185,-263); 
    image(leftupuparm, 0, 0);  // 左上上手臂
    pushMatrix();
      translate(+118, +264); // 再放回去正確的位置
      rotate(radians(angleX[2]));
      translate(-118,-264); 
      image(leftuparm, 0, 0);  // 左上手臂
    popMatrix();
   popMatrix();

  
  pushMatrix();
    translate(+290, +263); // 再放回去正確的位置
    rotate(radians(angleX[3]));
    translate(-290,-263); 
    image(rightupuparm, 0, 0);  // 右上上手臂
    pushMatrix();
      translate(+356, +259); // 再放回去正確的位置
      rotate(radians(angleX[4]));
      translate(-356,-259); 
      image(rightuparm, 0, 0);  // 右上手臂
    popMatrix();
  popMatrix();

  pushMatrix();
    translate(220,375);
    rotate(radians(angleX[5]));
    translate(-220,-375);
    image(foot1,0,0);
  popMatrix();
  
  pushMatrix();
    translate(261,372);
    rotate(radians(angleX[6]));
    translate(-261,-372);
    image(foot2,0,0);
  popMatrix();
  
}
