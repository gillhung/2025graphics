// week01-5_PImage_loadImage_background
// 請先用小畫家，做出 400x400 的 usachi.png
// 再從檔案總管 裡，把 usachi.png 圖檔，「拉到程式裡」
PImage img = loadImage("usachi.png");
size(400,400); // size()要與 圖片大小相同
background(img); // 才能顯示在背景裡
