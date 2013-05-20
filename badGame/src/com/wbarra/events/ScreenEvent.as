package com.wbarra.events
{
	import starling.events.Event;
	
	public class ScreenEvent extends Event
	{
		public static const CHANGE_SCREEN:String = "change screen";
		public var screenState:String;
		
		public function ScreenEvent(type:String, result:String,bubbles:Boolean=false)
		{
			super(type, bubbles);
			screenState = result
		}
		public function get result():String {return screenState;}
	}
}

