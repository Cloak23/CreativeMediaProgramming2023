class SceneManager
{
	private int scene_state = -1;
	private ArrayList<Scene> scene_list = new ArrayList<Scene>();

	SceneManager()
	{
		scene_list.add(new MainScene());
		scene_list.add(new Scene1());
		scene_list.add(new Scene2());
		scene_list.add(new Scene3());
		scene_list.add(new Scene4());

		scene_state = -1;
	}

	public void UpdateScreen()
	{
		scene_list.get(scene_state).UpdateScreen();
	}

	public void AddScreen(PImage image)
	{
		scene_list.get(scene_state).AddScreen(image);
	}

	public void update()
	{
		scene_list.get(scene_state).Print();
	}

	public void GotoNextScene()
	{
		// when there are no more scene
		if(scene_state >= scene_list.size())
		{
			return;
		}
		// scene_state == -1 (= at start the program), and check the require variable
		else if(scene_state < 0 || scene_list.get(scene_state).CheckRequire())
		{
			scene_state++;

			// call setup of next scene
			if(scene_state < scene_list.size()) scene_list.get(scene_state).Setup();
		}

	}
}
