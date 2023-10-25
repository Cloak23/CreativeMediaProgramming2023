import controlP5.*;

SceneManager scene_manager;
ControlP5 buttons;
AudioIn input;
Amplitude analyzer;


void setup() {
	size(600, 600);
	background(255);

	scene_manager = new SceneManager();
    input = new AudioIn(this, 0);
    analyzer = new Amplitude(this);
	buttons = new ControlP5(this);
}

void draw() {
	scene_manager.GotoNextScene();
	scene_manager.update();
}
