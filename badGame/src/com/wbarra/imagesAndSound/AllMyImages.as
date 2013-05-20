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
		 
		[Embed(source="images/bullet.png")]
		public static const BULLET:Class;
		
		[Embed(source="images/71squared-title.png")]
		public static const LOGO_71_SQRD:Class;
		
		[Embed(source="images/powered-by-starling-dark-450x160.png")]
		public static const LOGO_STARLING:Class;
		
		[Embed(source="images/zombieUnicorn.png")]
		public static const UNICORN:Class;
		
		[Embed(source="images/StartButton.png")]
		public static const STARTBUTTON:Class;
		
		[Embed(source="images/StartButtonOver.png")]
		public static const START_OVER:Class;
		
		[Embed(source="images/empty.png")]
		public static const EMPTY:Class;
		
		
		[Embed(source="images/mainShip.png")]
		public static const SHIP_IMAGE:Class;
		
		[Embed(source="images/shipShoot.png")]
		public static const SHIP_SHOOT:Class;
		
		// FONTS 
		
		[Embed(source="fonts/AlphaSentry/Alphav2.ttf", embedAsCFF="false", fontFamily="Alpha")]
		public static const Alpha:Class;
		
		public function AllMyImages()
		{
			super();
		}
		
	}
}