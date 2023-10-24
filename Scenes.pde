
class Scene
{
	ArrayList<PImage> images = new ArrayList<PImage>();
	// require가 true가 되었을 때 다음 스테이지로 넘어감
	protected boolean require = false;

	// 씬이 처음 로딩될 때 실행하는 메소드
	public void Setup()
	{

	}

	// require 확인하는 메소드
	public boolean CheckRequire()
	{
		return require;
	}

	// 매 update 마다 불러오는 메소드
	public void Print()
	{

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

// 첫 번째 씬
class Scene1 extends Scene
{
	// 버튼 이미지 선언
	PImage H_image, A_image, T_image;


	public void AddScreen(PImage image)
	{
		images.add(image);
	}

	public void Setup() {
		println("Setup");

		find_process = 0;

		// 배경이미지 추가
		images.add(loadImage("/Scene_1_Image/1.png"));
		images.add(loadImage("/Scene_1_Image/2.png"));
		images.add(loadImage("/Scene_1_Image/4.png"));
		images.add(loadImage("/Scene_1_Image/6.png"));
		images.add(loadImage("/Scene_1_Image/8.png"));
		images.add(loadImage("/Scene_1_Image/9.png"));
		images.add(loadImage("/Scene_1_Image/10.png"));

		// H A T 버튼의 이미지 불러오기
		H_image = loadImage("/Scene_1_Image/Button_H.png");
		//8:9
		H_image.resize(40, 45);

		A_image = loadImage("/Scene_1_Image/Button_A.png");
		//약 1:1.6
		A_image.resize(50, 80);

		T_image = loadImage("/Scene_1_Image/Button_T.png");
		//약 1:1.16
		T_image.resize(25, 29);

		// H A T 버튼 생성
		buttons
		.addButton("ButtonH")
		.setPosition(width/2, height/11)
		.setSize(H_image.width, H_image.height)
		.setImage(H_image);
		buttons
		.addButton("ButtonA")
		.setPosition(width/17, 4*height/7)
		.setSize(A_image.width, A_image.height)
		.setImage(A_image);
		buttons
		.addButton("ButtonT")
		.setPosition(7*width/9, 7*height/17)
		.setSize(T_image.width, T_image.height)
		.setImage(T_image);

		// 디버깅용 귀차니즘 버튼
		buttons
		.addButton("DebugButton")
		.setPosition(width/10, 9*height/10)
		.setSize(50, 50)
		.setImage(T_image);

		// 이미지들 전부 만들어준 후 업데이트 하기
		UpdateScreen();
	}


	public void Print()
	{
		// 3개 이상 요소를 찾으면 다음 스테이지로 넘김
		if(find_process >= 3)
		{
			require = true;
		}
 	}


}

// 두 번째 씬
class Scene2 extends Scene
{
	boolean do_rope = false, do_hand = false;

	PImage rope, hand;

	float rope_x = -100, rope_y = -100, goal_y = 0;
	float hand_x = -100, hand_y = -100, goal_x = 0;

	Rope rope_button;

	void Setup()
	{
		// buttons 초기화
		for(ControllerInterface<?> tmp : buttons.getAll())
		{
			buttons.remove(tmp.getName());
		}


		// 내려오는 로프 이미지 불러오기
		rope = loadImage("/Scene_1_Image/Button_H.png");
		rope.resize(80, 90);

		// 움직이는 손 이미지 불러오기
		hand = loadImage("/Scene_1_Image/Button_H.png");
		hand.resize(80, 90);

		// 로프 버튼 생성
		rope_button = new Rope(buttons, "Rope");
		rope_button.setPosition(width/4, 4*height/5);

		UpdateScreen();
	}
	void Print()
	{
		// 로프 이미지가 특정 높이에 도달했을 때
		if(rope_button != null && rope_button.getPosition()[1] <= height/17)
		{
			buttons.remove("Rope");
			rope_button = null;

			// 내려오는 로프 위치 초기화
			rope_x = width/2;
			rope_y = 0;
			goal_y = 4*height/7;
			image(rope, rope_x, rope_y);
			do_rope = true;
		}

		// 내려오는 로프 애니메이션 진행중
		if(do_rope)
		{
			RopeAnime();
		}
		if(do_hand)
		{
			HandAnime();
		}
		image(rope, rope_x, rope_y);
		image(hand, hand_x, hand_y);

	}

	// 내려오는 로프 애니메이션
	private void RopeAnime()
	{
		UpdateScreen();
		rope_y = lerp(rope_y, goal_y, 0.02);

		if(rope_y >= goal_y - 0.3)
		{
			do_rope = false;

			hand_x = width/5;
			hand_y = 6 * height/7;
			goal_x = 2 * width/5;
			goal_y = 9 * height/14;
			do_hand = true;
		}
	}

	// 움직이는 손 애니메이션
	private void HandAnime()
	{
		UpdateScreen();

		hand_x = lerp(hand_x, goal_x, 0.02);
		hand_y = lerp(hand_y, goal_y, 0.02);

		if(hand_y <= goal_y + 0.1 && hand_x >= goal_x - 0.3)
		{
			do_hand = false;

			require = true;
		}
	}
}

// 세 번째 씬
class Scene3 extends Scene
{
	void Setup()
	{
		background(255);
	}
	void Print()
	{
		stroke(0);
		fill(150);
		rect(50, 50, 100, 100);

		fill(0);
		text("Scene3", 100, 100);
	}
}
