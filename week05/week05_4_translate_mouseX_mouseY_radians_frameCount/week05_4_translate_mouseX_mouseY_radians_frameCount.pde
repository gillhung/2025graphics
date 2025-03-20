// week05_4_translate_mouseX_mouseY_rotate_radians_frameCount
// 比較 rotate 與 translate 的順序
void setup(){
  size(400,400);
}
void draw(){
  background(204);
  // 測試: 把下面2行，調一下順序
  // 會發現:畫東西之前的 translate() 才會有效果
  // 在電腦圖學裡，畫圖時，會照著之前「累積的移動、旋轉」來放東西
  translate(mouseX,mouseY); // 移到 mouse 所在位置
  rotate(radians(frameCount)); // 1秒有60的frame，轉60度
  rect(-50, -5, 100, 10); // 寬度100的棒子，但放左上角
}
