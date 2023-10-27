import processing.sound.*;

class Scene
{
	ArrayList<PImage> images = new ArrayList<PImage>();
	// require가 true가 되었을 때 다음 스테이지로 넘어감
	protected boolean require = false;
	private float trans_alpha = 0;

	boolean in_transition = false, out_transition = false;

	public void ResetButtons()
	{
		// buttons 초기화
		for(ControllerInterface<?> tmp : buttons.getAll())
		{
			buttons.remove(tmp.getName());
		}
	}

	// 씬이 처음 로딩될 때 실행하는 메소드
	public void Setup()
	{

	}

	public void Exit()
	{
		trans_alpha = 0;
		out_transition = true;
	}


	// require 확인하는 메소드
	public boolean CheckRequire()
	{
		return require;
	}

	// 매 update 마다 불러오는 메소드
	public void Print()
	{
		if(out_transition)
		{
			trans_alpha = lerp(trans_alpha, 255, 0.02);
			//println(trans_alpha);
			fill(0, 15);
			rect(0, 0, width, height);
			if(trans_alpha >= 200)
			{
				out_transition = false;
				require = true;
			}
		}
	}

	// 필요할 때 화면을 업데이트할때 쓰는 메소드
	public void UpdateScreen()
	{
		background(255);
		// 모든 이미지 resize 및 출력
		for(PImage tmp : images)
		{
			tmp.resize(600, 600);
			image(tmp, 0, 0);
		}
	}

	// 화면에 구성요소를 추가할 때 쓰는 메소드
	public void AddScreen(PImage image)
	{

	}
}

class MainScene extends Scene
{
	public void Setup()
	{
		super.Setup();

		ResetButtons();
		buttons
		.addButton("StartGame")
		.setPosition(3*width/4, height/3)
		.setSize(50, 50)
		.setLabel("Start");

		UpdateScreen();
	}

	// 필요할 때 화면을 업데이트할때 쓰는 메소드
	public void UpdateScreen()
	{
		super.UpdateScreen();

		stroke(0);
		fill(0);
		textAlign(CENTER);
		textSize(50);
		text("Escape", width/2, height/2);

		fill(255);
		rect(50, 500, 80, 80);
		fill(0);
		textSize(12);
		text("amu geu na", 90, 540);

		fill(255);
		rect(300, 500, 80, 80);
		fill(0);
		textSize(12);
		text("amu geu na", 340, 540);
	}

	public void Print()
	{
		super.Print();
		if(game_start)
		{
			Exit();
		}
	}

	public void Exit()
	{
		game_start = false;
		super.Exit();
	}
}

// 세 번째 씬
class Scene3 extends Scene
{
  Hat myHat;
  Hat myHat2;
  float clapLevel;    // How loud is a clap
  float quietLevel;
  PImage back; 
  boolean clapping = false; // are we clapping now?
  float maxHeight = 5; 
  float  originalY; // 원래 y좌표를 저장할 변수
  float  currentY = originalY;   // 현재 y좌표를 원래 y좌표로 초기화
  
  void Setup()
  {
    input.start();
    analyzer.input(input);
    
    back = loadImage("/Scene_3_Image/back.jpg"); 
    back.resize(600, 600);
// How quiet is silence

     clapLevel = 0.2;
     quietLevel = 0.1;
     originalY = height / 10;
     myHat = new Hat("/Scene_3_Image/hhat.png", width / 15, originalY, maxHeight); 
     myHat2 = new Hat("/Scene_3_Image/hhat.png", width / 2, originalY, maxHeight);
    
  }
  void Print()
  {
   background(back);
   float vol = analyzer.analyze();
  if(myHat == null) return;
  if(myHat2 == null) return;
  
  // 클랩이 없을 때만 모자가 천천히 내려오도록 합니다.
  if (!clapping) {
    myHat.y = lerp(myHat.y, originalY, 0.05); // 부드럽게 내려오기 위해 lerp 함수를 사용합니다.
    myHat2.y =lerp(myHat2.y, originalY, 0.05);
  }

  if (vol > clapLevel && !clapping) {
    clapping = true;
    myHat.jump(50 * vol); // 소리가 감지되면 모자를 위로 점프시킵니다.
    myHat2.jump(50 * vol);
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
  
  
  if(myHat.y == maxHeight) myHat = null;
  if(myHat2.y == maxHeight) myHat = null;
  
  if(myHat != null)	myHat.display();
  if(myHat2 != null) myHat2.display();
  }
}
