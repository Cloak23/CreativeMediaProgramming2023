class SceneManager
{
	public static final int MAX_SCENE_STATE = 3;
	private int scene_state = 0;
	private Scene[] scene_list = new Scene[MAX_SCENE_STATE];


	
	SceneManager()
	{
		scene_list[0] = new Scene1();
		scene_list[1] = new Scene2();
		scene_list[2] = new Scene3();
		scene_state = 0;
	}

	public void print()
	{
		scene_list[scene_state].print();
	}

	public void GotoNextScene()
	{
		if(scene_state >= MAX_SCENE_STATE - 1)
		{
			return;
		}
		if(scene_list[scene_state].CheckRequire())
		{
			scene_state++;
			scene_list[scene_state].Setup();	
		}

	}
}
