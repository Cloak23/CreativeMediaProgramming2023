int find_process = 0;
boolean game_start = false;

// when button pressed
public void controlEvent(ControlEvent theEvent) {
	// button sound play
		button_sound.play();
}

// Start Button Method
public void StartGame()
{
	game_start = true;
}

// 'h' button
public void ButtonH()
{
	// to go to next scene, increase the find_process
	find_process++;

	// result image(at the bottom of screen)
	PImage h_image = loadImage("/Scene_1_Image/Result_H.png");
	h_image.resize(600, 600);

	// remove the Button
	buttons.remove("ButtonH");

	// update the screen
	scene_manager.AddScreen(h_image);
	scene_manager.UpdateScreen();
}

// 'a' button
public void ButtonA()
{
	// to go to next scene, increase the find_process
	find_process++;

	// result image(at the bottom of screen)
	PImage a_image = loadImage("/Scene_1_Image/Result_A.png");
	a_image.resize(600, 600);

	// remove the Button
	buttons.remove("ButtonA");

	// update the screen
	scene_manager.AddScreen(a_image);
	scene_manager.UpdateScreen();
}

// 't' button
public void ButtonT()
{
	// to go to next scene, increase the find_process
	find_process++;

	// result image(at the bottom of screen)
	PImage t_image = loadImage("/Scene_1_Image/Result_T.png");
	t_image.resize(600, 600);

	// remove the Button
	buttons.remove("ButtonT");

	// update the screen
	scene_manager.AddScreen(t_image);
	scene_manager.UpdateScreen();
}

// for debugging
public void DebugButton()
{
	find_process = 3;
}

// class for rope animation
class Rope extends Button {
	PImage rope_image, input_image;
  Rope(ControlP5 cp5, String theName) {
    super(cp5, theName);
  }


  // on drag the rope
  void onDrag() {
  	// now mouse pointer
    Pointer p1 = getPointer();
    float py = getHeight();

    // resize the image and rope button
    input_image = rope_image.copy();
    this.setImage(input_image);
    this.setSize(int(p1.x() + 70), int((py - p1.y()) + 70));
		input_image.resize(getWidth(), getHeight());

    this.setPosition(getPosition()[0], getPosition()[1] + (py - getHeight()));

		scene_manager.UpdateScreen();

  }

}