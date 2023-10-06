abstract class Scene
{
	private boolean require = true;

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
	public void print()
	{

	}
}

class Scene1 extends Scene
{
	private Button new_button = new Button(width/2, height/3*2, 200, 70, "Start", 15);
	public void print()
	{
		textSize(24);
		fill(0);
		text("Main Scene", width/2, height/3);

		new_button.Draw();
 	}

 	public void Button()
 	{

 	}

}

class Scene2 extends Scene
{
	void print()
	{
		stroke(0);
		fill(150);
		rect(50, 50, 100, 100);
	}
}

class Scene3 extends Scene
{
	void print()
	{
		stroke(0);
		fill(255);
		rect(50, 50, 100, 100);
	}	
}
