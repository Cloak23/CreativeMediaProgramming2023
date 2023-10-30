class MainScene extends Scene
{
	PImage main_image;
	public void Setup()
	{
		super.Setup();
		ResetButtons();

		// add start button
		buttons
		.addButton("StartGame")
		.setPosition(7*width/11, 2.5*height/11)
		.setSize(130, 130)
		.setColor(new CColor(0,0,0,0,0).setAlpha(0))
		.setLabel("Enter")
		.setColorLabel(255);

		// load main background image
		main_image = loadImage("/main.png");
		main_image.resize(600, 600);
		images.add(main_image);

		UpdateScreen();
	}

	public void Print()
	{
		super.Print();

		// to care some issue
		if(game_start)
		{
			Exit();
		}
	}

	public void Exit()
	{
		// to care some issue
		game_start = false;
		super.Exit();
	}
}