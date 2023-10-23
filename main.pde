import controlP5.*;

SceneManager scene_manager = new SceneManager();
ControlP5 buttons;



void setup() {
	size(600, 600);
	background(255);

	buttons = new ControlP5(this);
}

void draw() {
	scene_manager.GotoNextScene();
	scene_manager.update();
}

void mousePressed() {

}
