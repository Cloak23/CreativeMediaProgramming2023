class Scene3 extends Scene
{
  Hat myHat;
  Hat myHat2;
  float clapLevel;    // How loud is a clap
  float quietLevel;
  PImage back; 
  boolean clapping = false; // are we clapping now?
  float maxHeight = 30; 
  float  originalY;
  float  currentY = originalY;
  
  void Setup()
  {
    input.start();
    analyzer.input(input);
    back = loadImage("/Scene_3_Image/back.png"); 
    back.resize(600,600);
// How quiet is silence

     clapLevel = 0.2;
     quietLevel = 0.1;
     originalY = height/6;
     myHat = new Hat("/Scene_3_Image/hhat.png", 60, originalY, maxHeight); 
     myHat2 = new Hat("/Scene_3_Image/hhatR.png", 140, originalY, maxHeight);

  }
  void Print()
  {
   if(!out_transition)background(back);
  	super.Print();
   float vol = analyzer.analyze();
  if(myHat == null) return;
  if(myHat2 == null) return;
  
  // go down hat
  if (!clapping) {
    myHat.y = lerp(myHat.y, originalY, 0.1);
    myHat2.y =lerp(myHat2.y, originalY, 0.1);
  }

  if (vol > clapLevel && !clapping) {
    // jump hat
    clapping = true;
    myHat.jump(100 * vol);
    myHat2.jump(100 * vol);
  } else if (clapping && vol < quietLevel) {
    clapping = false;
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
  
  
  if(myHat.y == maxHeight) 
  {
  	myHat = null;
  	Exit();
  }
  if(myHat2.y == maxHeight) 
  {
  	myHat2 = null;
    Exit();
  }
  
  if(myHat != null)	myHat.display();
  if(myHat2 != null) myHat2.display();
  }
}
