package 
{
	import com.wbarra.controller.Game;
	
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(width="600", height="400", frameRate="60", backgroundColor="#0000FF")]
	
	public class main extends Sprite
	{
		
		private var mStarling:Starling;
		private var _mStarling:Starling;
		
		public function main()
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
