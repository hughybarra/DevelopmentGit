package com.wbarra.game.objects
{
	import com.wbarra.imagesAndSound.AllMyImages;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class TurretGun extends Sprite
	{
		private var __turretGun:Image;
		public function TurretGun()
		{
			super();
			__turretGun= Image.fromBitmap(new AllMyImages.SHIP_SHOOT());
			addChild( __turretGun);
		}
	}
}