class SceneManager
{
	private int scene_state = 0;
	private ArrayList<Scene> scene_list = new ArrayList<Scene>();


	
	SceneManager()
	{
		scene_list.add(new Scene1());
		scene_list.add(new Scene2());
		scene_list.add(new Scene3());
		scene_state = 0;
	}

	public void update()
	{
		scene_list.get(scene_state).Print();
		scene_list.get(scene_state).Button();
	}

	public void GotoNextScene()
	{
		if(scene_state >= scene_list.size())
		{
			return;
		}
		else if(scene_list.get(scene_state).CheckRequire())
		{
			scene_state++;

			if(scene_state < scene_list.size()) scene_list.get(scene_state).Setup();	
		}

	}
}
