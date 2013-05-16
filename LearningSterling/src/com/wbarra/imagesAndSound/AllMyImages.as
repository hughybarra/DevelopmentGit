package com.wbarra.imagesAndSound
{
	import starling.display.Sprite;
	
	public class AllMyImages extends Sprite
	{
		
		[Embed(source="images/ball.png")]
		public static const BALL:Class;
		
		[Embed(source="images/turret.png")]
		public static const TURRET:Class;
		
		[Embed(source="images/stage.png")]
		public static const GAME_STAGE:Class;
		 
		[Embed(source="images/ship.png")]
		public static const SHIP:Class;
		
		[Embed(source="images/bullet.png")]
		public static const BULLET:Class;
		
		public function AllMyImages()
		{
			super();
		}
		
	}
}