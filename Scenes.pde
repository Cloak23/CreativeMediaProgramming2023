
class Scene
{
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

	// 임시로 넣은거 안쓸거임
	public void Button()
	{

	}

	// 매 update 마다 불러오는 메소드
	public void Print()
	{

	}

	// 필요할 때 화면을 업데이트할때 쓰는 메소드
	public void UpdateScreen()
	{

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
	ArrayList<PImage> images = new ArrayList<PImage>();
	PImage H_image, A_image, T_image;

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
		H_image.resize(40, 45);
		A_image = loadImage("/Scene_1_Image/Button_A.png");
		A_image.resize(50, 80);
		T_image = loadImage("/Scene_1_Image/Button_T.png");
		T_image.resize(25, 29);

		// H A T 버튼 생성
		buttons
		.addButton("ButtonH")
		.setPosition(width/2, height/11)
		//8:9비율
		.setSize(H_image.width, H_image.height)
		.setImage(H_image);
		buttons
		.addButton("ButtonA")
		.setPosition(width/17, 4*height/7)
		//약 1:1.6비율
		.setSize(A_image.width, A_image.height)
		.setImage(A_image);
		buttons
		.addButton("ButtonT")
		.setPosition(7*width/9, 7*height/17)
		//약 1: 1.16
		.setSize(T_image.width, T_image.height)
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
	void Setup()
	{
		background(255);
	}
	void Print()
	{
		stroke(0);
		fill(150);
		rect(50, 50, 100, 100);
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
	}
}
