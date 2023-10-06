class Button
{
  private int x, y, width, height;
  private PFont font;
  private String label;
  private int fontSize;
  
  private int delay = 0, framesPassed = 0;
  
  public Button(int x, int y, int width, int height, String label, int fontSize)
  {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    // this.font = createFont("Arial", 16, true);
    this.fontSize = fontSize;
    this.label = label;
  }
  
  public void Draw()
  {
    fill(255);
    stroke(0);
    rect(x, y, width, height);
    // textFont(font, fontSize);
    noStroke();
    fill(0);
    text(label, x + 5, y + (height - fontSize) / 2 + (height / 2));
    
    // if(framesPassed < delay)
    // {
    //   framesPassed++;
    // }
  }
  
  public void SetFrameDelay(int delay)
  {
    this.delay = delay;
  }
  
  public boolean IsPressed()
  {    
    if(!mousePressed)
    {
      return false;
    }
    
    if(mouseX >= x && mouseX <= x + width)
    {
      if(mouseY >= y && mouseY <= y + (height))
      {
        if(framesPassed == delay)
        {
          framesPassed = 0;
          return true;
        }
      }
    }
    
    return false;
  }
}