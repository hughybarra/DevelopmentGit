package 
{
	import com.wbarra.controller.Game;
	
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(width="1024", height="768", frameRate="60", backgroundColor="#000000")]
	
	public class tempProj extends Sprite
	{
		
		private var mStarling:Starling;
		private var _mStarling:Starling;
		
		public function tempProj()
		{
//			// These settings are recommended to avoid problems with touch handling
//			stage.scaleMode = StageScaleMode.NO_SCALE;
//			stage.align = StageAlign.TOP_LEFT;
//			
//			// Create a Starling instance that will run the "Game" class
//			mStarling = new Starling(Game, stage);
//			mStarling.start();
			
			
			mStarling = new Starling(Game, stage);
			mStarling.start();
			
//			_mStarling = new Starling(ball, stage);
//			_mStarling.start();
			
			
			
		}
	}
}
