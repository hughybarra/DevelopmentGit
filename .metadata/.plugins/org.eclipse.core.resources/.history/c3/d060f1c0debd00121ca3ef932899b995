package com.wbarra.game.objects
{
	
	import com.wbarra.imagesAndSound.AllMyImages;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Ball extends Sprite
	{
		public function Ball()
		{
			super();
			
			var test:Image = Image.fromBitmap(new AllMyImages.BALL());
			addChild(test);
			
			x = 200;
			y = 50;
		}
		
		public function move():void
		{
			x += 5;
			y += 5;
		}
	}
}