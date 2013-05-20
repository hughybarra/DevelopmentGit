package com.wbarra.YMath
{
	public class YGetAngle
	{
		public function YGetAngle()
		{
			
		}
		
		public static function GetAngle(x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			var dx:Number = x2 - x1;
			var dy:Number = y2 - y1;
			
			return Math.atan2(dy,dx);
		}
	}
}