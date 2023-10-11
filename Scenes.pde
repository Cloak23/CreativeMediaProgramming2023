class Scene
{
	protected boolean require = false;

	public void Setup()
	{

	}

	public boolean CheckRequire()
	{
		return require;
	}
	public void Button()
	{

	}

	public void Print()
	{

	}
}

class Scene1 extends Scene
{
	private Button closet_button = new Button(width/2, height/3*2, 200, 70, "Start", 15, true);
	private Button clock_part_1 = new Button(width/2, height/3*2, 200, 70, "clock part 1", 15, false);


	private int clock_part_count = 0;

	private ArrayList<Button> button_list = new ArrayList<Button>();

	public void Setup() {

	}
	
	public void Button()
	{
		if(closet_button.is_active)
		{
			closet_button.Draw();
			if(closet_button.IsPressed())
			{
				closet_button.is_active = false;
				clock_part_1.is_active = true;
				clock_part_1.SetFrameDelay(40);
			}	
		}
		if(clock_part_1.is_active)
		{
			clock_part_1.Draw();
			if(clock_part_1.IsPressed())
			{
				clock_part_1.is_active = false;
				clock_part_count++;
			}
		}
	}
	public void Print()
	{
		textSize(24);
		fill(0);
		text("Main Scene", width/2, height/3);


 	}


}

class Scene2 extends Scene
{
	void Print()
	{
		stroke(0);
		fill(150);
		rect(50, 50, 100, 100);
	}
}

class Scene3 extends Scene
{
	void Print()
	{
		stroke(0);
		fill(255);
		rect(50, 50, 100, 100);
	}	
}
