SceneManager scene_manager = new SceneManager();



void setup() {
	size(600, 600);
}

void draw() {
	background(255);
	scene_manager.print();
}

void mousePressed() {
	scene_manager.GotoNextScene();
}
