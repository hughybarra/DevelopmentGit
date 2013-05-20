package com.wbarra.game.objects
{
	import com.wbarra.imagesAndSound.AllMyImages;
	import com.wbarra.imagesAndSound.AllMySounds;
	
	import flash.media.Sound;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Turret extends Sprite
	{
		
		private var _bullet:Bullet;
		private var __alive:Boolean = true;
		private var _bulletArray:Array = [];
		private var _bulletCounter:uint = 0;
		private var _shoot:Sound = new AllMySounds.SHOT;
		private var _turretGun:Image;
		private var _firing:Boolean = false;
		
		
		public function Turret()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		private function onAdded():void
		{
			var turret:Image = Image.fromBitmap(new AllMyImages.SHIP_IMAGE());
			turret.x = 225 ;
			turret.y = 680;
			addChild( turret);
			_turretGun= Image.fromBitmap(new AllMyImages.SHIP_SHOOT());
			_turretGun.x = 225;
			_turretGun.y = 675;
			addChild( _turretGun);
			
			for (var j:int = 0; j < 50; j++) 
			{
				var bullet:Bullet = new Bullet();
				_bulletArray.push( bullet );
			}  
		}

		public function get _alive():Boolean
		{
			return __alive;
		}
		public function getBullets():Array
		{
			return _bulletArray;
		}

		public function set _alive(value:Boolean):void
		{
			__alive = value;
		}
		
		public function turretShoot(target:Ship):void
		{
			_bulletArray[_bulletCounter].x = 225;
			_bulletArray[_bulletCounter].y = 680;
			_bulletArray[_bulletCounter]._bulletTarget = target;
			_bulletArray[_bulletCounter]._alive = true;
			parent.addChild(_bulletArray[_bulletCounter]);
			_bulletCounter ++;
			if (_bulletCounter == 50)
			{
				_bulletCounter = 0;
			}
			_shoot.play();
			_firing = true;
		}
		
		public function firing():void
		{
			
			
			if (_firing)
			{
				_turretGun.y += 1;
			}
			
			if (_turretGun.y > 680)
			{
				_turretGun.y = 675;
				_firing = false;
			}
			
		}
		
		


	}
}