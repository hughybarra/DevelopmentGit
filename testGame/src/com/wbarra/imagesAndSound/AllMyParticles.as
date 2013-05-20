package com.wbarra.imagesAndSound
{
	import starling.display.Sprite;
	
	public class AllMyParticles extends Sprite
	{
		// RAIN 
		[Embed(source ="particles/rain.pex", mimeType ="application/octet-stream")]
		public static const RAIN_CONFIG:Class;
		
		[Embed(source ="particles/rain.png")]
		public static const RAIN:Class;
		// END RAIN 
		
		// SPACE 
		[Embed(source ="particles/space.pex", mimeType = "application/octet-stream")]
		public static const SPACE_CONFIG:Class;
		
		[Embed(source = "particles/dot.png")]
		public static const DOT:Class;
		// END SPACE 
		
		[Embed(source ="particles/explosion.pex", mimeType = "application/octet-stream")]
		public static const EXPLOSION_CONFIG:Class;
		
		[Embed(source = "particles/explosion.png")]
		public static const EXPLOSION:Class;
		
		public function AllMyParticles()
		{
			super();
		}
	}
}