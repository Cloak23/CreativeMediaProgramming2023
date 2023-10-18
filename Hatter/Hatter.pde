import processing.sound.*;
Hat myHat; // Hat 객체
Hat myHat2;
AudioIn input;
Amplitude analyzer;
PImage back ;
float clapLevel = 0.2;    // How loud is a clap
float quietLevel = 0.1;  // How quiet is silence
boolean clapping = false; // are we clapping now?

float originalY; // 원래 y좌표를 저장할 변수
float currentY;  // 현재 y좌표를 저장할 변수

void setup() {
  size(600, 600);
  // prepare mic and Amplitude to analyze it.
  input = new AudioIn(this, 0);
  input.start();
  analyzer = new Amplitude(this);
  analyzer.input(input);
  back = loadImage("back.jpg");
  back.resize(600,600);
  originalY = height / 10; // 원래 y좌표를 화면 중앙으로 설정
  currentY = originalY;   // 현재 y좌표를 원래 y좌표로 초기화
  float maxHeight = 5; 
  myHat = new Hat("hhat.png", width / 15, originalY, maxHeight);
  myHat2 = new Hat("hhat.png", width / 2, originalY, maxHeight);
}

void draw() {
 background(back);
  float vol = analyzer.analyze();

  // 클랩이 없을 때만 모자가 천천히 내려오도록 합니다.
  if (!clapping) {
    myHat.y = lerp(myHat.y, originalY, 0.05); // 부드럽게 내려오기 위해 lerp 함수를 사용합니다.
    myHat2.y =lerp(myHat2.y, originalY, 0.05);
  }

  if (vol > clapLevel && !clapping) {
    clapping = true;
    myHat.jump(200 * vol); // 소리가 감지되면 모자를 위로 점프시킵니다.
    myHat2.jump(100 * vol);
  } else if (clapping && vol < quietLevel) {
    clapping = false; // 클랩이 끝났으니, 모자가 다시 내려올 수 있도록 상태를 변경합니다.
  }

  // Draw a volume bar with threshold indicators
  noStroke();
  fill(200);
  rect(0, 0, 20, height);
  float y = map(vol, 0, 1, height, 0);
  float ybottom = map(quietLevel, 0, 1, height, 0);
  float ytop = map(clapLevel, 0, 1, height, 0);
  fill(100);
  rect(0, y, 20, y);
  stroke(0);
  line(0, ybottom, 19, ybottom);
  line(0, ytop, 19, ytop);

  myHat.display();
  myHat2.display();
  //class를 하나 뺴서 pimage를 구현해서 x,y값 넣어두고 
}
