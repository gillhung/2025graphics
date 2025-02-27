// week02_6
// 想要有很多段，不要「一筆畫」一直接著畫
ArrayList<Integer> x,y; // 先有兩個「還沒準備好」的(小的)資料結構，等mousePressed，再新增準備
ArrayList<ArrayList<Integer>> xx = new ArrayList<ArrayList<Integer>>(); // 大的資料結構
ArrayList<ArrayList<Integer>> yy = new ArrayList<ArrayList<Integer>>();
PImage img;
void setup(){
  size(400,400);
  img = loadImage("usachi.png");
} // 記得把圖檔，(像上周一樣)拉到程式碼裡
void draw(){
  background(img);
  fill(255,200); // 半透明的色彩，白色，alpha(透明度)值是128
  rect(0,0,400,400); // 畫超大的四邊形，全部蓋住
  // 上面是 week02_4，下面是 week02_3，但線卻無法上去
  for(int I=0; I<xx.size(); I++){ // 大寫I 對應大的資料結構
    ArrayList<Integer> x = xx.get(I); // 取出裡面的小的資料結構
    ArrayList<Integer> y = yy.get(I);
    for(int i=1;i<x.size();i++){ // 小的，再照就畫
      line(x.get(i),y.get(i),x.get(i-1),y.get(i-1));
    }
  }
}
void mouseDragged(){
  x.add(mouseX);
  y.add(mouseY);
}
void mousePressed(){ // 滑鼠按下去時，建「新的」資料結構
  x = new ArrayList<Integer>(); xx.add(x);
  y = new ArrayList<Integer>(); yy.add(y);
}
