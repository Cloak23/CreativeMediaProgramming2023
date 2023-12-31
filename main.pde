import controlP5.*;
import controlP5.Button;
import processing.video.*;

SceneManager scene_manager;
ControlP5 buttons;
AudioIn input;
Amplitude analyzer;
SoundFile file, button_sound;

void setup() {
	size(600, 600);
	background(255);

	// last ending credit movie
	movie = new Movie(this, "Ending.mp4");
	scene_manager = new SceneManager();
  input = new AudioIn(this, 0);
  file = new SoundFile(this, "/sound/Linger a While.mp3");
  button_sound = new SoundFile(this, "/sound/button_sound.mp3");
  file.play();
  analyzer = new Amplitude(this);
	buttons = new ControlP5(this);
}

void draw() {

	// call the GotoNextScene and update at each frame
	scene_manager.GotoNextScene();
	scene_manager.update();
}

// for ending credit movie
void movieEvent(Movie movie) {
  movie.read();
}
