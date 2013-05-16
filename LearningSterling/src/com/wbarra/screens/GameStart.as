package com.wbarra.screens
{
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class GameStart extends Sprite
	{
		public function GameStart()
		{
			super();
			
			var startButton:TextField = new TextField(100, 50, "START");
			startButton.color = 0xFFFFFF;
			addChild(startButton);
		}
	}
}