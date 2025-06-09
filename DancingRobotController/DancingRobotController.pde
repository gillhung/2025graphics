PShape head, body, arm, arm2, leg, leg2;

float[] angleX = new float[10]; // 每個部位在 3D 空間中的 X 軸旋轉角度
float[] angleY = new float[10]; // 每個部位在 3D 空間中的 Y 軸旋轉角度
int ID = 0; // 當前控制的部位 ID

ArrayList<String> lines = new ArrayList<String>();
boolean playing = false; // 是否播放動畫
int R = 0;

void setup() {
  size(600, 600, P3D);
  head = loadShape("head.obj");
  body = loadShape("body.obj");
  arm = loadShape("arm.obj");
  arm2 = loadShape("righthand.obj");
  leg = loadShape("leg.obj");
  leg2 = loadShape("rightleg.obj");

}

void draw() {
  background(240);
  lights();
  translate(width/2,height/2, 0);
  scale(1,-1,1);
  sphere(10);
  scale(50);
  
  // 畫身體 ID=0
  pushMatrix();
    //translate(mouseX/100.0,-mouseY/100.0);
    //rotateY(radians(mouseX-200));
    //rotateX(radians(mouseY-170));
    rotateY(radians(angleX[0]));
    //if(mousePressed) println(mouseX/100.0,mouseY/100.0);
    shape(body); // 畫身體   
  popMatrix();
  
  if (playing) myInterpolate();


 // 畫頭部 ID=1
  pushMatrix();
    //translate(mouseX/100.0,-mouseY/100.0);
    translate(-0.06 ,3.01); // 相對於身體的位置
    //rotateY(radians(mouseX-200));
    //rotateX(radians(mouseY-170));
    rotateY(radians(-angleX[1]));
    rotateX(radians(angleY[1]));
    translate(0.03 ,-3.01); // 相對於身體的位置
    //if(mousePressed) println(mouseX/100.0,mouseY/100.0);
    shape(head);
    
  popMatrix();

  // 畫左手臂 ID=2
  pushMatrix();
    //translate(mouseX/100.0,-mouseY/100.0,0);
    translate(0.4 ,2.71); // 相對於身體的位置
      //rotateX(radians(frameCount));
     //rotateX(radians(mouseY));
     //rotateZ(radians(mouseX));
    //rotateY(radians(mouseX-200));
    //rotateX(radians(mouseY-170));
    rotateX(radians(angleY[2]));
    rotateZ(radians(angleX[2]));
    translate(-0.4 , -2.71); // 相對於身體的位置
    //if(mousePressed) println(mouseX/100.0,mouseY/100.0);
    shape(arm);
  popMatrix();

  // 畫右手臂 ID=3
  pushMatrix();
     translate(-0.46 ,2.64); // 相對於身體的位置
     //rotateX(radians(frameCount));
     //rotateX(radians(mouseY-180));
     //rotateZ(radians(mouseX-180));
    //rotateY(radians(mouseX-200));
    //rotateX(radians(mouseY-170));
    rotateX(radians(angleY[3]));
    rotateZ(radians(angleX[3]));
    translate(0.46 , -2.64); // 相對於身體的位置
    //if(mousePressed) println(mouseX/100.0,mouseY/100.0);
    shape(arm2);
  popMatrix();

  // 畫左腿 ID=4
  pushMatrix();
    //translate(mouseX/100.0,-mouseY/100.0,0);
    translate(0.32, 1.45); // 相對於身體的位置
    //rotate(radians(frameCount));
    //rotateX(radians(mouseY-180));
    //rotateZ(radians(mouseX-180));
    //rotateY(radians(mouseX-200));
    //rotateX(radians(mouseY-170));
    rotateX(radians(angleY[4]));
    rotateZ(radians(angleX[4]));
    translate(-0.32, -1.45); // 相對於身體的位置
    //if(mousePressed) println(mouseX/100.0,mouseY/100.0);
    shape(leg);
  popMatrix();

  // 畫右腿 ID=5
  pushMatrix();
  //translate(mouseX/100.0,-mouseY/100.0,0);
    translate(-0.32, 1.45); // 相對於身體的位置
    //rotate(radians(frameCount));
    //rotateX(radians(mouseY-180));
    //rotateZ(radians(mouseX-180));
    //rotateY(radians(mouseX-200));
    //rotateX(radians(mouseY-170));
    rotateX(radians(angleY[5]));
    rotateZ(radians(angleX[5]));
    translate(0.32, -1.45); // 相對於身體的位置
    //if(mousePressed) println(mouseX/100.0,mouseY/100.0);
    shape(leg2);
  popMatrix();


}

void mouseDragged() {
  angleX[ID] += mouseX - pmouseX; // 左右拖曳
  angleY[ID] += mouseY - pmouseY; // 上下拖曳
}

void keyPressed() {
  if (key == 's') {
    String now = "";
    for (int i = 0; i < 10; i++) {
      now += angleX[i] + " " + angleY[i] + " ";
    }
    lines.add(now);
    saveStrings("angles.txt", lines.toArray(new String[0]));
    println("已存檔: " + now);
  }

  if (key == 'r') {
    String[] file = loadStrings("angles.txt");
    if (file != null) {
      for (String line : file) {
        lines.add(line);
        println("讀檔: " + line);
      }
    }
  }

  if (key == 'p') playing = !playing;

  if (key == '0') ID = 0; // 身體
  if (key == '1') ID = 1; // 頭
  if (key == '2') ID = 2; // 左手
  if (key == '3') ID = 3; // 右手
  if (key == '4') ID = 4; // 左腿
  if (key == '5') ID = 5; // 右腳

}

void myInterpolate() {
  if (lines.size() >= 2) {
    float alpha = (frameCount % 30) / 30.0;
    if (alpha == 0.0) R = (R + 1) % lines.size();
    int R2 = (R + 1) % lines.size();
    float[] oldAngle = float(split(lines.get(R), ' '));
    float[] newAngle = float(split(lines.get(R2), ' '));
    for (int i = 0; i < 10; i++) {
      angleX[i] = oldAngle[i * 2 + 0] * (1 - alpha) + newAngle[i * 2 + 0] * alpha;
      angleY[i] = oldAngle[i * 2 + 1] * (1 - alpha) + newAngle[i * 2 + 1] * alpha;
    }
  }
}
