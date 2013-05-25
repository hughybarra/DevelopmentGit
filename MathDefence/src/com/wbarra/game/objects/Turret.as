package com.wbarra.game.objects
{
	import com.wbarra.imagesAndSound.AllMyImages;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.deg2rad;
	
	public class Turret extends Sprite
	{
		
		private var __bullet:Bullet;
		private var __alive:Boolean = true;
		private var __firing:Boolean = false;
		private var __turretGun:TurretGun;
		private var __turret:Image;
		private var __rads:Number = 0;
		
		public function Turret()
		{
			super();
			// TODO Auto Generated method stub
			__turret = Image.fromBitmap(new AllMyImages.SHIP_IMAGE());
			x = 220 ;
			y = 680;
			addChild( __turret);
			
			__turretGun = new TurretGun();
			addChild( __turretGun);

		}
		
		
		public function get _rads():Number
		{
			return __rads;
		}

		public function set _rads(value:Number):void
		{
			__rads = value;
		}

		public function set _firing(value:Boolean):void
		{
			__firing = value;
		}

		public function get _firing():Boolean
		{
			return __firing;
		}

		public function get _alive():Boolean
		{
			return __alive;
		}

		public function set _alive(value:Boolean):void
		{
			__alive = value;
		}
		
		public function firing():void
		{			
			if (__firing)
			{
				__turretGun.y += 1;
			}
			if (__turretGun.y > 5)
			{
				__turretGun.y = 0;
				__firing = false;
			}
		}


	}
}