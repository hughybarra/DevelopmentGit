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
			x = 210;
			y = 680;
		}
		
		private function shoot():void
		{
			// when the turret shoots. it shoots a bullet 
			// when the turret shoots it rotates in the direction of the bullet shot 
			// animate the bullet shooting
			// if the answer is typed in make some sort of sound. 
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