class Hat {
  PImage hatImage; 

  float x, y; 
  float maxY;  // 모자가 도달할 수 있는 최대 높이.

  // 생성자에서 모자 이미지를 로드하고 초기 위치를 설정합니다.
  Hat(String imagePath, float startX, float startY, float maxY) {
    hatImage = loadImage(imagePath); 
    hatImage.resize(300,300);
    x = startX;
    y = startY;
    this.maxY = maxY; // 최대 높이를 초기화합니다.
  }

  // 모자가 점프하는 것을 시뮬레이션하는 메서드. 제한된 높이까지만 점프합니다.
void jump(float amount) {
  if (y - amount > maxY) { // 만약 제안된 높이가 maxY 이상이라면,
    y -= amount; // 모자의 높이를 변경합니다.
  } else {
    y = maxY; // 아니라면, 모자의 높이를 maxY에 고정합니다.
    // 여기서 originalY를 수정하지 않습니다. 모자가 자연스럽게 내려올 수 있도록 합니다.
  }
}
  // 화면에 모자를 그리는 메서드
  void display() {
    image(hatImage, x, y); // 이미지 그리기
  }
}
