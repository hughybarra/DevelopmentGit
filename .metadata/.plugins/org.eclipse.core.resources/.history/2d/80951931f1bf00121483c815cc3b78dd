package com.wbarra.game.objects
{
	import com.wbarra.imagesAndSound.AllMyImages;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Bullet extends Sprite
	{
		
		private var __alive:Boolean = false;
		private var __posX:Number;
		private var __posY:Number;
		private var __speed:Number = 3;
		private var __bulletTarget:Ship;
		private var __changeX:Number;
		private var __changeY:Number;
		private var __angle:Number;
		private var __rads:Number;
		private var __distanceX:Number;
		private var __distanceY:Number;
		private var __testNumber:Number;
		
		public function Bullet(alive:Boolean = false, posX:Number = 0, posY:Number = 0)
		{
			super();
			
			var bullet:Image = Image.fromBitmap(new AllMyImages.BULLET()); 
			__alive = alive;
			__posX  = posX;
			__posY  = posY;
			
			addChild(bullet);
		}
		
		
		//GETTERS AND SETTERS 
		///////////////////////////////
		///////////////////////////////

		public function get _distanceX():Number
		{
			return __distanceX;
		}

		public function get _distanceY():Number
		{
			return __distanceY;
		}
		
		public function set _posY(value:Number):void
		{
			__posY = value;
		}

		public function set _posX(value:Number):void
		{
			__posX = value;
		}

		public function set _bulletTarget(value:Ship):void
		{
			__bulletTarget = value;
		}
		public function get _bulletTarget():Ship{
			return __bulletTarget;
		}

		public function set _alive(value:Boolean):void
		{
			__alive = value;
		}
		public function get _alive():Boolean
		{
			return __alive;
		}
		///////////////////////////////
		///////////////////////////////

		public function bulletTargetingSysetm():void
		{
		
			if (__alive == true)
			{
				__changeX  = __bulletTarget._newX - x;
				__changeY  = __bulletTarget._newY -y;
				__angle    = Math.atan2(__changeY, __changeX) * (180/ Math.PI) ;
				__rads     = __angle * Math.PI /180;
				
				x += Math.cos(__rads) * __speed;
				y += Math.sin(__rads) * __speed;
				
				//setting distance to be a positive number 
				__distanceX = x - __bulletTarget.x;
				__distanceY = y - __bulletTarget.y;
				
				if (__distanceX < 0)
				{
					__distanceX *= -1;
				}
				if(__distanceY < 0)
				{
					__distanceY *= -1;
				}
				
				if (!__bulletTarget._alive)
				{
					//bullets disipate 
					alpha -= .05;
					
				}
			}
			
		}
		public function bulletDeath():void
		{
			//remove myself from stage
			__alive = false;
		}
	}
}