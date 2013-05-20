package com.wbarra.screens
{
	import com.wbarra.imagesAndSound.AllMyParticles;
	import com.wbarra.imagesAndSound.AllMySounds;
	
	import flash.media.Sound;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.extensions.PDParticleSystem;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	
	public class GameStage extends Sprite
	{
		private var __score:int = 50;
		private var __scoreBoard:TextField;
		private var __answer:String;
		private var __inputText:TextField;
		private var __ps:PDParticleSystem;
		private var __waveUpdate:TextField;
		private var __waveNumber:uint;
		
		public function GameStage()
		{
			super();
			
			// LOADING BACKGROUND MUSIC 
			//-------------------------
			var bgMusic:Sound = new AllMySounds.BG_MUSIC();
			bgMusic.play();
			// LOADING BACKGROUND MUSIC 
			//-------------------------
			
			
			// PARTICLE STAGE 
			//---------------
			var psConfig:XML = XML(new  AllMyParticles.SPACE_CONFIG() );
			var psTexture:Texture = Texture.fromBitmap(new AllMyParticles.DOT());
			/////			//create the particle system 
			__ps = new PDParticleSystem(psConfig, psTexture);	
			__ps.x = 400;
			__ps.y = 300;
			addChild( __ps);
			Starling.juggler.add( __ps);
			__ps.emitterX = 0;
			__ps.emitterY = 0;
			__ps.start(300.0);
			// PARTICLE STAGE 
			//---------------
			// wave 
			//============================
			var waveField:TextField = new TextField(100, 50, "Wave: ");
			waveField.x = 50;
			waveField.y = 10;
			waveField.color = 0xFFFFFF;
			addChild ( waveField );
			
			__waveUpdate = new TextField(100, 50, String(__waveNumber));
			__waveUpdate.x = 100;
			__waveUpdate.y = 10;
			__waveUpdate.color = 0xFFFFFF;
			addChild( __waveUpdate );
			
			//Score
			//=============================
			var scoreText:TextField = new TextField(100, 50, "Score: ");
			scoreText.x = 650;
			scoreText.y = 10;
			scoreText.color = 0xFFFFFF;
			addChild( scoreText );
			__scoreBoard = new TextField(100, 50, "0"); // need to find a way to update this 
			__scoreBoard.x = 700;
			__scoreBoard.y = 10;
			__scoreBoard.color = 0xFFFFFF;
			addChild(__scoreBoard);
			__inputText = new TextField(100, 20, "Answer");
			__inputText.x = 190;
			__inputText.y = 730;
			__inputText.color = 0xFFFFFF;
			__inputText.border = true;
			addChild(__inputText);
			//=============================
		}

		// GETTERS AND SETTERS 
		//////////////////////////////////
		//////////////////////////////////

		public function get _waveNumber():uint
		{
			return __waveNumber;
		}

		public function set _waveNumber(value:uint):void
		{
			__waveNumber = value;
			updateAll();
		}

		public function set _answer(value:String):void
		{
			__answer = value;
		}

		public function get _score():int
		{
			return __score;
		}

		public function set _score(value:int):void
		{
			__score = value;
			updateAll();
		}
		
		//////////////////////////////////
		//////////////////////////////////
		
		public function updateAnswer():void
		{
			__inputText.text = __answer;	
		}
		private function updateAll():void
		{
			__scoreBoard.text = String(__score);
			__waveUpdate.text = String(__waveNumber);
		}

	}
}