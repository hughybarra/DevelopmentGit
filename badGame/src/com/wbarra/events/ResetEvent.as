package com.wbarra.events
{
	import starling.events.Event;
	
	public class ResetEvent extends Event
	{
		
		public static const RESET_EVENT:String = "reset";
		public var resetCheck:Boolean;
		
		public function ResetEvent(type:String, result:Boolean, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
			resetCheck = result;
		}
		public function get result():Boolean{return resetCheck;}
	}
}