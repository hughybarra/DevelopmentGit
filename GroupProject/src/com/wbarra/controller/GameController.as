package com.wbarra.controller
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class GameController extends Sprite
	{
		public function GameController()
		{
			super();
			var quad:Quad = new Quad(200, 200, Color.RED);
			quad.x = 100;
			quad.y = 50;
			addChild(quad);
			
			
			var test:TextField = new TextField(50, 100, "test");
			addChild(test);
		}
		
	}
}