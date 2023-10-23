import controlP5.*;

SceneManager scene_manager = new SceneManager();
ControlP5 buttons;



void setup() {
	size(600, 600);

	buttons = new ControlP5(this);
}

void draw() {
	background(255);
	scene_manager.GotoNextScene();
	scene_manager.update();
}

void mousePressed() {

}
