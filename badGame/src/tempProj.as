package 
{
	import com.wbarra.controller.Game;
	
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(width="512", height="768", frameRate="60", backgroundColor="#000000")]
	
	public class tempProj extends Sprite
	{
		
		private var mStarling:Starling;
		private var _mStarling:Starling;
		
		public function tempProj()
		{
			mStarling = new Starling(Game, stage);
			mStarling.start();
		}
	}
}
