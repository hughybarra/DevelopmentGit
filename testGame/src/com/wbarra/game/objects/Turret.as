package com.wbarra.game.objects
{
	import com.wbarra.imagesAndSound.AllMyImages;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Turret extends Sprite
	{
		
		private var __bullet:Bullet;
		private var __alive:Boolean = true;
		
		
		public function Turret()
		{
			super();
			var turret:Image = Image.fromBitmap(new AllMyImages.TURRET);
			addChild(turret);
			
			scaleX = scaleY = .5;
			x = 380;
			y = 525;
		}

		public function get _alive():Boolean
		{
			return __alive;
		}

		public function set _alive(value:Boolean):void
		{
			__alive = value;
		}


	}
}