package com.wbarra.managers
{
	import com.wbarra.game.objects.Bullet;

	public class BulletManager
	{
		private var _bulletArray:Array = [];
		
		public function BulletManager()
		{
			// building my bullets 
			for (var j:int = 0; j < 100; j++) 
			{
				var bullet:Bullet = new Bullet();
				_bulletArray.push( bullet );
			}
		}

		public function getBullets():void
		{
			
		}
	}
}