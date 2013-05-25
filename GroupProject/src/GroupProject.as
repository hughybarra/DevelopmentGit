package
{
	import com.wbarra.controller.GameController;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	
	
	public class GroupProject extends Sprite
	{
		
		private var _starling:Starling;
		public function GroupProject()
		{
			trace("running");
			// These settings are recommended to avoid problems with touch handling
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			// Create a Starling instance that will run the "Game" class
			_starling = new Starling(GameController, stage);
			_starling.start();
			
			
		}
	}
}