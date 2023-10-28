// 두 번째 씬
class Scene2 extends Scene
{
	// 버튼 이미지 선언
	PImage H_image, A_image, T_image;


	public void AddScreen(PImage image)
	{
		images.add(image);
	}

	public void Setup() {
		super.Setup();
		ResetButtons();

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

		// // 디버깅용 귀차니즘 버튼
		// buttons
		// .addButton("DebugButton")
		// .setPosition(width/10, 9*height/10)
		// .setSize(50, 50)
		// .setImage(T_image);

		// 이미지들 전부 만들어준 후 업데이트 하기
		UpdateScreen();
	}


	public void Print()
	{
		super.Print();
		// 3개 이상 요소를 찾으면 다음 스테이지로 넘김
		if(find_process >= 3)
		{
			ResetButtons();
			Exit();
		}
 	}

 	public void Exit()
 	{
 		super.Exit();
 		find_process = 0;
 	}


}