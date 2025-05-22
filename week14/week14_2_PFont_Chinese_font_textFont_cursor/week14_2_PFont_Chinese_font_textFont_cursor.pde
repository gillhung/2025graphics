// week14_2_PFont_Chinese_font_textFont_cursor
PFont font1,font2,font3;
void setup(){
  size(300,300);
  font1 = createFont("Times New Roman Bold Italic",50);
  font2 = createFont("微軟正黑體 Bold",50);
  font3 = createFont("elffont-rock.otf",50); // 注音文的精靈字體
}
void draw(){
  background(0); // 黑色背景
  cursor(CROSS);
  fill(255); // 預設是白色的填充色
  textFont(font1);
  text("Hello 中文",mouseX+20,mouseY-20);
  fill(#0B63DB); // Tool - color Selector，再 copy 你要的顏色
  textFont(font2);
  text("Hello 中文",mouseX+20,mouseY+50); // 下面一點點
  fill(#E40CE8);
  textFont(font3);
  text("ㄅㄆㄇ",mouseX+20,mouseY+100); // 再下面一點點
}
