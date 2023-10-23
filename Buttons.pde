int find_process = 0;

// 버튼이 눌려질 때마다 발생하는 이벤트
public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
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