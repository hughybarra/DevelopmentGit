package com.wbarra.screens
{
	import com.wbarra.events.ResetEvent;
	import com.wbarra.game.objects.Bullet;
	import com.wbarra.game.objects.Ship;
	import com.wbarra.game.objects.Turret;
	import com.wbarra.imagesAndSound.AllMyParticles;
	import com.wbarra.imagesAndSound.AllMySounds;
	import com.wbarra.managers.ShipDistanceCalculator;
	
	import flash.display3D.IndexBuffer3D;
	import flash.media.Sound;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.extensions.PDParticleSystem;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	
	public class GameStage extends Sprite
	{
		
		// for some reason i'm losing a ship 
		
		private var _answers:String;
		private var _answersArray:Array = []; // array 
		private var _battleField:Sprite;
		private var _currentQuestions:Array = []; // array 
		private var _shipDistanceX:Number;
		private var _shipDistanceY:Number;
		private var _error:Sound = new AllMySounds.ERROR;
		private var _explosion:Sound = new AllMySounds.POP;
		private var _gameStage:GameStage;
		private var _gameOver:GameOver;
		private var _gameTurret:Turret;
		private var _inputText:TextField;
		private var _levelScoreCounter:uint;
		private var _numberOfShips:uint = 5;
		private var _ps:PDParticleSystem;
		private var _reset:Boolean = true;	
		
		private var _scoreBoard:TextField;
//		private var _score:uint = 0;
		
		private var _shipArray:Array = []; // array
		
		private var _totalScore:uint = 0;
		
		private var _turret:Turret;
		private var _userAnswer:String = "";
		private var _updateWave:TextField;
		private var _waveNum:uint;
		
		public function GameStage()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, runGame);
		}
		
		
		public function runGame():void
		{
			var bgMusic:Sound = new AllMySounds.BG_MUSIC();
//			bgMusic.play();
			var psConfig:XML = XML(new  AllMyParticles.SPACE_CONFIG() );
			var psTexture:Texture = Texture.fromBitmap(new AllMyParticles.DOT());

			_ps = new PDParticleSystem(psConfig, psTexture);	
			_ps.x = 400;
			_ps.y = 300;
			addChild( _ps);
			Starling.juggler.add( _ps);
			_ps.emitterX = 0;
			_ps.emitterY = 0;
			_ps.start(300.0);

			// WAVE
			var waveField:TextField = new TextField(100, 50, "Wave: ");
			waveField.x = 50;
			waveField.y = 10;
			waveField.color = 0xFFFFFF;
			addChild ( waveField );
			_updateWave = new TextField(100, 50, String(_waveNum));
			_updateWave.x = 100;
			_updateWave.y = 10;
			_updateWave.color = 0xFFFFFF;
			addChild( _updateWave );
			
			// SCORE 
			var scoreText:TextField = new TextField(100, 50, "Score: ");
			scoreText.x = 412 - scoreText.width/2;
			scoreText.y = 50;
			scoreText.color = 0xFFFFFF;
			addChild( scoreText );
			_scoreBoard = new TextField(100, 50, String(_totalScore)); // need to find a way to update this 
			_scoreBoard.x =462 - _scoreBoard.width/2;
			_scoreBoard.y = 10;
			_scoreBoard.color = 0xFFFFFF;
			addChild(_scoreBoard);
			
			// INPUT answer
			_inputText = new TextField(100, 20, String(_totalScore));
			_inputText.x = 190;
			_inputText.y = 730;
			_inputText.color = 0xFFFFFF;
			_inputText.border = true;
			addChild(_inputText);
			//=============================
			
			_battleField = new Sprite(); 
			addChild( _battleField );
			
			
			for (var i:int = 0; i < _numberOfShips; i++) 
			{
				var ship:Ship =  new Ship(true);
				_currentQuestions.push(ship._question);
				_answersArray.push(ship._answer);
				_shipArray.push( ship );
				_battleField.addChild( ship );
			}// end for i loop 
			
			for each (var q:String in _currentQuestions) 
			{
				trace(_currentQuestions[h]+ " :"+_answersArray[h]);
				h++;
			}
			 
			_turret = new Turret();
			_battleField.addChild( _turret );
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			_battleField.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			var h:uint = 0;
			//============================
		}
		private function onKeyDown(e:KeyboardEvent):void
		{
			var character:String = String.fromCharCode(e.charCode);
			
			if (
				e.charCode == 48 || e.charCode == 49
				|| e.charCode == 50 || e.charCode == 51
				|| e.charCode == 52 || e.charCode == 53
				|| e.charCode == 54 || e.charCode == 55
				|| e.charCode == 56 || e.charCode == 57
				|| e.keyCode == 8
			)
			{
				_userAnswer += character;
				
				// if you press delete 
				if (e.keyCode == 8)
				{
					_userAnswer = "";
				}
				
			}// end if 
			
			// if you hit enter or space bar check answer
			if (e.keyCode == 32 || e.keyCode == 13) // spacebar
			{
				var answerCheck:Boolean = false;
				
				for each (var s:Ship in _shipArray) 
				{
					if (Number(_userAnswer) == s._answer && s._alive)
					{
						_turret.turretShoot( s );
						answerCheck = true;
					}// end number = answer
				}// end space bar loop 
				
				// if answer is not equal to input
				if (!answerCheck)
				{
					_error.play();
				}
				// reset the answer
				_userAnswer = "";
			}
		}		
		
		private function onEnterFrame():void
		{
			_turret.firing();
//			_turret.firing();
//			_scoreBoard.text = String(_totalScore);
//				
//			for each (var s:Ship in _shipArray) 
//			{
//				 //<===============================
//				var distX:Number;
//				var distY:Number;
//				for each( var ship2:Ship in _shipArray)
//				{
//					distX = ShipDistanceCalculator.getX(s, ship2);
//					distY = ShipDistanceCalculator.getY(s, ship2);
//					
//					// pushing the ships apart 
//					if(s != ship2){
//						if (distX < 50 && distY < 50)
//						{
//							if (s.x > ship2.x)
//							{
//								s.x += 1;
//								ship2.x -= 1;
//							}
//							else
//							{
//								s.x -= 1;
//								ship2.x += 1;
//							}
//						}
//					}
//				}
//				
//				if(s._alive)
//				{
//					s.shipMove();
//					
//					_distanceY = _turret.y - s.y;
//					_distanceX = _turret.x - s.x;
//					
////					// what is this doinmg?
////					// i think this is game over right here 
//					if (_distanceY <= 5 && _distanceX <= 5)
//					{
////						_totalScore = 0;
//						_numberOfShips = 1;
////						resetGame();
//					}
//					for each (var b:Bullet in _turret.getBullets()) 
//					{
//						_inputText.text = _userAnswer;
//						b.bulletTargetingSysetm();
//						
//						// setting distance to a positive number
//						if(_distanceY < 0)
//						{
//							_distanceY *= -1;
//						}
//						
//						// bullet hits target 
//						if ((b._distanceX <= 5 || b._distanceY <=5) && b._alive)
//						{
//							targetHit( b );
//							b.bulletDeath();
//						}
//					}// end for each loop 
//				}
//				
//				trace(_score);
//				trace(_shipArray.length);
//				if (_shipArray.length == _score)
//				{
//					trace(_shipArray.length);
//					_score = 0;
//					_waveNum ++;
////					resetGame();
//				}
//				// when enemy ships hit turret
//				if (_distanceY >= 0)
//				{
//					s.shipDeath(); // move this to game over	 
////					gameOver(); 
//				}
//			}// end for each loop 
//			
//			// when all ships are shot down. 
			
			
			//=================
			// BREAKING STUFF 
			//=================
			_inputText.text = String(_totalScore);
//			trace(_scoreBoard.text);
			
			// for each loop, tracking all ships 
			for each (var s:Ship in _shipArray)
			{
//				trace(s._alive);
				var distX:Number;
				var distY:Number;
				
				for each (var ship2:Ship in _shipArray)
				{
					distX = ShipDistanceCalculator.getX(s, ship2);
					distY = ShipDistanceCalculator.getY(s, ship2);
					
					if (s != ship2)
					{
						if (distX < 50 && distY< 50)
						{
							s.x += 1;
							ship2.x -= 1;
						}
						else 
						{
							s.x -= 1;
							ship2.x += 1;
						}
					}// end if 
				}// end for each 
			}// end fore each 
			
			if (s._alive)
			{
				s.shipMove();
				
				_shipDistanceY = _turret.y - s.y;
				_shipDistanceX = _turret.x - s.x;
				_shipDistanceY = Math.abs(_shipDistanceY);
				_shipDistanceX = Math.abs(_shipDistanceX);
				
				if ( _shipDistanceY <= 5 && _shipDistanceX <= 5)
				{
					_totalScore = 0;
					_numberOfShips = 1;
					resetGame();
				}// end if 
			}// end if 
			
			for each (var b:Bullet in _turret.getBullets())
			{
				_inputText.text = _userAnswer;
				b.bulletTargetingSysetm();
				
				if ((b._distanceX <= 2 || b._distanceY <= 2) && b._alive)
				{
					targetHit( b );
					b.bulletDeath();
				}// end if 
				
				// game over function 
				if (_shipDistanceY >= 670)
				{
					
				}
				
			}// end for each loop 
			
			if (_shipArray.length == _levelScoreCounter)
			{
				_levelScoreCounter = 0;
				_waveNum ++;
				resetGame();
			}
			//=================
			// BREAKING STUFF 
			//=================
		} 	
		private function targetHit(b:Bullet):void
		{
			
			// FIX THIS TO MAKE AN ARRAY OF PSCONFIGS OR SOMETHING
			
			var psConfig:XML = XML(new  AllMyParticles.EXPLOSION_CONFIG() ); // <===============
			var psTexture:Texture = Texture.fromBitmap(new AllMyParticles.EXPLOSION());
			var psConfig2:XML = XML(new AllMyParticles.EXPLOSION_CONFIG() );
			var psTexture2:Texture = Texture.fromBitmap(new AllMyParticles.EXPLOSION());
			_ps = new PDParticleSystem(psConfig, psTexture);	
			_ps.x = 0;
			_ps.y = 0;
			addChild( _ps );
			Starling.juggler.add( _ps );
			_ps.emitterX = b.x;
			_ps.emitterY = b.y;
			_ps.start(.01);
			
			
			if(b._bulletTarget._alive)
			{
				trace("hit");
				_battleField.removeChild( b._bulletTarget );
				_battleField.removeChild( b );
				b._bulletTarget._alive = false;
				b.bulletDeath();
			
				_levelScoreCounter ++;
				_totalScore ++;
			}
			
			_explosion.play();
		}
		private function resetGame():void
		{
			_answersArray      = [];
			_currentQuestions 	= [];
			_shipArray 		= [];
			while( _battleField.numChildren > 0)
			{
				_battleField.removeChildAt(0);8 
			}
			_battleField.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			removeChild(_ps);
			Starling.juggler.remove(_ps);
			_numberOfShips++;
			_waveNum ++;
			runGame();
		}
		private function gameOver():void
		{
			_answersArray      = [];
			_currentQuestions 	= [];
			_shipArray 		= [];
			_totalScore = 0;
			
			while( _battleField.numChildren > 0)
			{
				_battleField.removeChildAt(0);8 
			}
			_battleField.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			removeChild(_ps);
			Starling.juggler.remove(_ps);
			_gameOver = new GameOver();
			addChild( _gameOver );
		}
	}
}