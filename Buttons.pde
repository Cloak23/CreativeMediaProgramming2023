int find_process = 0;
boolean game_start = false;

// 버튼이 눌려질 때마다 발생하는 이벤트
public void controlEvent(ControlEvent theEvent) {
	//if(theEvent.getController().isMousePressed())
	//{
		println("소리 난다");
		button_sound.play();
		//사운드 재생
	//}
}

public void StartGame()
{
	game_start = true;
}

public void ButtonH()
{
	// 탐색 진행도 올리기
	find_process++;

	// 결과 이미지 불러오기
	PImage h_image = loadImage("/Scene_1_Image/Result_H.png");
	h_image.resize(600, 600);

	//현재 버튼 없애기
	buttons.remove("ButtonH");

	//결과 이미지 추가 후 업데이트
	scene_manager.AddScreen(h_image);
	scene_manager.UpdateScreen();
}
public void ButtonA()
{
	// 탐색 진행도 올리기
	find_process++;

	// 결과 이미지 불러오기
	PImage a_image = loadImage("/Scene_1_Image/Result_A.png");
	a_image.resize(600, 600);

	//현재 버튼 없애기
	buttons.remove("ButtonA");

	//결과 이미지 추가 후 업데이트
	scene_manager.AddScreen(a_image);
	scene_manager.UpdateScreen();
}
public void ButtonT()
{
	// 탐색 진행도 올리기
	find_process++;

	// 결과 이미지 불러오기
	PImage t_image = loadImage("/Scene_1_Image/Result_T.png");
	t_image.resize(600, 600);

	//현재 버튼 없애기
	buttons.remove("ButtonT");

	//결과 이미지 추가 후 업데이트
	scene_manager.AddScreen(t_image);
	scene_manager.UpdateScreen();
}

public void DebugButton()
{
	find_process = 3;
}

// 로프를 위해 준비한 로프 전용 클래스
class Rope extends Button {
	PImage rope_image, input_image;
  Rope(ControlP5 cp5, String theName) {
    super(cp5, theName);
  }

  void onDrag() {
    Pointer p1 = getPointer();

    float py = getHeight();
    input_image = rope_image.copy();
    this.setImage(input_image);
    this.setSize(int(p1.x() + 70), int((py - p1.y()) + 70));
		input_image.resize(getWidth(), getHeight());

    this.setPosition(getPosition()[0], getPosition()[1] + (py - getHeight()));

		scene_manager.UpdateScreen();

  }

}