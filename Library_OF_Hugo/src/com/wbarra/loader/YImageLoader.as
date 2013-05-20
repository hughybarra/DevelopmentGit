package com.wbarra.loader
{
	import com.wbarra.event.YImageEvent;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	
	public class YImageLoader extends EventDispatcher
	{
		private var _ld:Loader;
		
		public function YImageLoader(pathName:String)
		{
			super();
			_ld = new Loader();
			var url:URLRequest = new URLRequest(pathName);
			_ld.load(url);
			_ld.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
		}// end YImageLoader
		
	
		private function onComplete(event:Event):void
		{
			var e:YImageEvent = new YImageEvent(YImageEvent.IMAGE_LOAD);
			e.image = event.target.content;
			dispatchEvent(e);
			
			_ld.content.removeEventListener(Event.COMPLETE, onComplete);
			_ld.unload();
			_ld = null;
		} // end onComplete();
	}// end YImageLoader Event;
}// End Com.wbarra.loader;


