// week08_1_loadShape_shape
size(400,400,P3D); // Step03: 要有 P3D 的 OpenGL 3D 功能
PShape gundam = loadShape("Gundam.obj"); // Step01: 讀入 3D 模型
translate(width/2, height/2);
pushMatrix(); // 備份矩陣
  translate(0,100); // Step05: 再往下一點點，比較好看
  scale(10,-10,10); // Step04: 把模型放大 shape(10) 上下要再倒過來
  shape(gundam,0,0); // Step02: 畫出 3D 模型
popMatrix(); // 還原矩陣
