
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
		println("Setup");


		PImage[] images = {loadImage("/Scene_1_Image/1.png"), loadImage("/Scene_1_Image/2.png"), loadImage("/Scene_1_Image/3.png"), 
		loadImage("/Scene_1_Image/4.png"), loadImage("/Scene_1_Image/5.png"), loadImage("/Scene_1_Image/6.png"), loadImage("/Scene_1_Image/7.png"), 
		loadImage("/Scene_1_Image/8.png"), loadImage("/Scene_1_Image/9.png"), loadImage("/Scene_1_Image/10.png"), loadImage("/Scene_1_Image/11.png")};

		for(PImage tmp : images)
		{
			tmp.resize(600, 600);
			image(tmp, 0, 0);
		}

		PImage image = loadImage("/Scene_1_Image/Button_H.png");
		image.resize(70, 100);

		buttons
		.addButton("ButtonH")
		.setPosition(200, 200)
		.setSize(70, 100)
		.setImage(image);
		buttons
		.addButton("ButtonA")
		.setPosition(400, 400)
		.setSize(100, 100);
		buttons
		.addButton("ButtonT")
		.setPosition(600, 600)
		.setSize(100, 100);

	}

	public void ButtonH()
	{

	}
	public void ButtonA()
	{
		
	}
	public void ButtonT()
	{
		
	}

	public void Print()
	{

 	}


}

class Scene2 extends Scene
{
	void Setup()
	{
		
	}
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
