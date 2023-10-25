// 첫 번째 씬
class Scene1 extends Scene
{
	boolean do_rope = false, do_hand = false;

	PImage rope, hand;

	float rope_x = -100, rope_y = -100, goal_y = 0;
	float hand_x = -100, hand_y = -100, goal_x = 0;

	Rope rope_button;

	void Setup()
	{
		ResetButtons();


		// 내려오는 로프 이미지 불러오기
		rope = loadImage("/Scene_1_Image/Button_H.png");
		rope.resize(80, 90);

		// 움직이는 손 이미지 불러오기
		hand = loadImage("/Scene_1_Image/Button_H.png");
		hand.resize(80, 90);

		// 로프 버튼 생성
		rope_button = new Rope(buttons, "Rope");
		rope_button.setPosition(width/4, 4*height/5);

		UpdateScreen();
	}
	void Print()
	{
		// 로프 이미지가 특정 높이에 도달했을 때
		if(rope_button != null && rope_button.getPosition()[1] <= height/17)
		{
			buttons.remove("Rope");
			rope_button = null;

			// 내려오는 로프 위치 초기화
			rope_x = width/2;
			rope_y = 0;
			goal_y = 4*height/7;
			image(rope, rope_x, rope_y);
			do_rope = true;
		}

		// 내려오는 로프 애니메이션 진행중
		if(do_rope)
		{
			RopeAnime();
		}
		if(do_hand)
		{
			HandAnime();
		}
		image(rope, rope_x, rope_y);
		image(hand, hand_x, hand_y);

	}

	// 내려오는 로프 애니메이션
	private void RopeAnime()
	{
		UpdateScreen();
		rope_y = lerp(rope_y, goal_y, 0.02);

		if(rope_y >= goal_y - 0.3)
		{
			do_rope = false;

			hand_x = width/5;
			hand_y = 6 * height/7;
			goal_x = 2 * width/5;
			goal_y = 9 * height/14;
			do_hand = true;
		}
	}

	// 움직이는 손 애니메이션
	private void HandAnime()
	{
		UpdateScreen();

		hand_x = lerp(hand_x, goal_x, 0.02);
		hand_y = lerp(hand_y, goal_y, 0.02);

		if(hand_y <= goal_y + 0.1 && hand_x >= goal_x - 0.3)
		{
			do_hand = false;

			require = true;
		}
	}
}
