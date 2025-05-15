// week 13_1_processing_video
// Sketch - Library - Manage Libraries ... 安裝 video
// 教學在 http://processing.org/tutorias/video
import processing.video.*; // Java 使用外掛的「匯入」
// 有視訊鏡頭的，用這個版本(沒視訊鏡頭，老師會再加幾行)
Capture video; // 有視訊鏡頭，用這個版本
Movie movie; // 沒有鏡頭，改用這個 
void setup(){
  size(640,960);
  //video = new Capture(this,640,480);
  //video.start(); // 打開視訊
  movie = new Movie(this,"street.mov");
  movie.loop();
}
void draw(){
  //if(video.available()) video.read();
  //image(video,0,0); // 若沒視訊就註解掉
  if(movie.available()) movie.read();
  image(movie,0,0);
}
