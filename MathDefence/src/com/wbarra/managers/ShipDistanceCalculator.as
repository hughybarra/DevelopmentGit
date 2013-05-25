package com.wbarra.managers
{
	import com.wbarra.game.objects.Ship;

	public class ShipDistanceCalculator
	{
		public function ShipDistanceCalculator()
		{
		}
		
		
		public static function getX(ship1:Ship, ship2:Ship):Number
		{
			
			var distance:Number;
			
			distance = ship1.x - ship2.x;
			
			if (distance < 0)
			{
				distance *= -1;
			}
			return distance;
		}
		
		public static function getY(ship1:Ship, ship2:Ship):Number
		{
			var distance:Number;
			distance = ship1.y - ship2.y;
			
			if (distance < 0)
			{
				distance *= -1;
			}
			
			return distance;
		}
		
		
	}
}