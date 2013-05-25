package com.wbarra.controller
{
	import com.wbarra.events.ScreenEvent;
	import com.wbarra.screens.GameStart;
	
	import feathers.controls.ScreenNavigator;
	
	import starling.display.Sprite;
	
	public class ScreenNavigator extends Sprite
	{
		private var _startScreen:GameStart;
		private var _runGame:Game;
		private var _mode:String;
		
		public function ScreenNavigator()
		{
			super();
			
			
			_runGame = new Game();
			_startScreen = new GameStart();
			addChild( _startScreen );
			_startScreen.addEventListener( ScreenEvent.CHANGE_SCREEN, playGame );
		}
		
		private function playGame(event:ScreenEvent):void
		{
			removeChild( _startScreen );
			addChild( _runGame );
			_startScreen.removeEventListener( ScreenEvent.CHANGE_SCREEN, playGame);
			_runGame.addEventListener( ScreenEvent.CHANGE_SCREEN, goToStart);
		}
		
		private function goToStart():void
		{
			removeChild( _runGame );
			addChild( _startScreen );
			_runGame.removeEventListener( ScreenEvent.CHANGE_SCREEN, goToStart);
			_startScreen.addEventListener( ScreenEvent.CHANGE_SCREEN, playGame );
		}
	}
}