
package com.wbarra.event
{
	import flash.display.Bitmap;
	import flash.events.Event;
	
	public class YImageEvent extends Event
	{
		
		public static const IMAGE_LOAD:String = "imageload";
		public var image:Bitmap;
		
		public function YImageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new YImageEvent(type, bubbles, cancelable);
		}
	}
}