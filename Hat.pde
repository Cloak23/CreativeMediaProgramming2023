public class Hat {
  PImage hatImage; 

  float x, y; 
  float maxY;  

  Hat(String imagePath, float startX, float startY, float maxY) {
    hatImage = loadImage(imagePath); 
    x = startX;
    y = startY;
    hatImage.resize(400, 400);
    // hat max height
    this.maxY = maxY;
  }


void jump(float amount) {
  // if hat over the max Y position
  if (y - amount > maxY) {
    y -= amount;
  } else {
    y = maxY;
  }
}
  // draw the hat
  void display() {
    image(hatImage, x, y);
  }
}
