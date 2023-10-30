import processing.sound.*;

class Scene
{
	// background images arraylist
	ArrayList<PImage> images = new ArrayList<PImage>();

	// if require is true, go to next scene
	protected boolean require = false;

	// for screen transition
	private float trans_alpha = 0;
	boolean in_transition = false, out_transition = false;


	// reset the all buttons
	public void ResetButtons()
	{
		// reset buttons
		for(ControllerInterface<?> tmp : buttons.getAll())
		{
			buttons.remove(tmp.getName());
		}
	}

	// when start up the scene, call the method
	public void Setup()
	{

	}

	// when end the scene, call the method
	public void Exit()
	{
		trans_alpha = 0;
		out_transition = true;
	}


	// check the require for protected variable
	public boolean CheckRequire()
	{
		return require;
	}

	// call in each frame
	public void Print()
	{
		if(out_transition)
		{
			// lerp the alpha
			trans_alpha = lerp(trans_alpha, 255, 0.02);
			//println(trans_alpha);

			// draw the black rectangle with little alpha
			stroke(0);
			fill(0, 15);
			rect(0, 0, width, height);

			// go to next scene
			if(trans_alpha >= 200)
			{
				out_transition = false;
				require = true;
			}
		}
	}

	// when I need to update the screen, I call it
	public void UpdateScreen()
	{
		background(255);

		// draw all of background images
		for(PImage tmp : images)
		{
			tmp.resize(600, 600);
			image(tmp, 0, 0);
		}
	}

	// add the background image to the images arraylist
	public void AddScreen(PImage image)
	{
		images.add(image);
	}
}