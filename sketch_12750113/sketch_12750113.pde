// week06_7_push_RRT_many_TRT_inside_pop
// 慢慢組合出機器手臂
void setup(){
   size(800,800,P3D); 
}

void draw(){
  background(255); 
  translate(width/2, height/2); 
  sphere(10); 
  
  fill(252,131,77);
  

  pushMatrix(); 
    //if(mousePressed && mouseButton == RIGHT) rotateY(radians(frameCount)); // Step03:右鍵旋轉
    //if(mousePressed && mouseButton == RIGHT) rotateZ(radians(frameCount)); // Step02:右鍵旋轉
    rotateY(radians(frameCount));
    rotateZ(radians(frameCount));

    translate(0,-37.5); 
    box(25,75,25); // 手臂
    pushMatrix(); 
      translate(0,-25); 
      
      rotateZ(radians(frameCount)); 
      translate(0,25,0); // 
      box(25,50,25); // 手肘
      
      pushMatrix();
        translate(0,25); 
        rotateZ(radians(frameCount));
        translate(25,0,0); 
        box(50,25,25);
        pushMatrix();
          translate(25,0); 
          rotateZ(radians(frameCount));
          translate(-25,0,0); 
          box(50,25,25);
          pushMatrix();
            translate(-25,0); 
            rotateZ(radians(frameCount));
            translate(-25,0,0); 
            box(50,25,25);
            pushMatrix();
              translate(-25,0); 
              rotateZ(radians(frameCount));
              translate(-25,0,0); 
              box(50,25,25);
              pushMatrix();
                translate(-25,0); 
                rotateZ(radians(frameCount));
                translate(-25,0,0); 
                box(50,25,25);
                pushMatrix();
                  translate(-25,0); 
                  rotateZ(radians(frameCount));
                  translate(-25,0,0); 
                  box(50,25,25);
                  pushMatrix();
                    translate(-25,0); 
                    rotateZ(radians(frameCount));
                    translate(-25,0,0); 
                    box(50,25,25);
                    pushMatrix();
                      translate(-25,0); 
                      rotateZ(radians(frameCount));
                      translate(-25,0,0); 
                      box(50,25,25);
                      pushMatrix();
                        translate(-25,0); 
                        rotateZ(radians(frameCount));
                        translate(12.5,0,0); 
                        box(25,12.5,25); // 小手腕 
                      popMatrix();
                    popMatrix();
                  popMatrix();
                popMatrix();
              popMatrix();
            popMatrix();
          popMatrix();
        popMatrix();
      popMatrix();
      
    popMatrix(); 
  popMatrix();
}
float x = 0,y = 0; 
void mouseDragged(){ 
  x += mouseX - pmouseX; 
  y += mouseY - pmouseY; 
  println("x:" + x + "y:" + y);
}
