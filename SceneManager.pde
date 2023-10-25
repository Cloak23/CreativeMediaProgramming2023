class SceneManager
{
	private int scene_state = -1;
	private ArrayList<Scene> scene_list = new ArrayList<Scene>();

	SceneManager()
	{
		scene_list.add(new Scene1());
		scene_list.add(new Scene2());
		scene_list.add(new Scene3());

		// -1에서 1 올려서 첫 씬 불러오려고 -1로 초깃값 설정함
		scene_state = -1;
	}

	// 현재 씬 업데이트 하고싶을 때
	public void UpdateScreen()
	{
		scene_list.get(scene_state).UpdateScreen();
	}

	// 현재 씬에 배경을 추가하고 싶을 때
	public void AddScreen(PImage image)
	{
		scene_list.get(scene_state).AddScreen(image);
	}

	// 매 프레임 호출하는 메소드
	public void update()
	{
		scene_list.get(scene_state).Print();
	}

	// 다음 씬 넘어갈때 쓰는 메소드
	public void GotoNextScene()
	{
		// 씬 더 없으면 안넘김
		if(scene_state >= scene_list.size())
		{
			return;
		}
		// -1인 경우 ( = 시작할 때 ), 씬의 require체크 후 다음 씬으로 넘어가기
		else if(scene_state < 0 || scene_list.get(scene_state).CheckRequire())
		{
			scene_state++;

			// 다음 씬의 Setup은 꼭 불러줘야함
			if(scene_state < scene_list.size()) scene_list.get(scene_state).Setup();
		}

	}
}
