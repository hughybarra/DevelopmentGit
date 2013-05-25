package com.wbarra.controller
{
	import com.wbarra.events.ScreenEvent;
	import com.wbarra.game.objects.Bullet;
	import com.wbarra.game.objects.Ship;
	import com.wbarra.game.objects.Turret;
	import com.wbarra.imagesAndSound.AllMyParticles;
	import com.wbarra.imagesAndSound.AllMySounds;
	import com.wbarra.managers.ShipDistanceCalculator;
	import com.wbarra.screens.GameStage;
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.extensions.PDParticleSystem;
	import starling.textures.Texture;
	
	public class Game extends Sprite
	{
		private var __numberOfShips:uint = 2;
		private var __shipArray:Array = [];
		private var __bulletArray:Array = [];
		private var __bulletCounter:uint = 0;
		private var __userAnswer:String = "";
		private var __score:uint = 0;
		private var __gameStage:GameStage;
		private var __turret:Turret;
		private var __battleField:Sprite;
		private var __currentQuestions:Array = [];
		private var __answersArray:Array = [];
		private var __distanceY:Number;
		private var __totalScore:uint;
		private var __distanceX:Number;
		private var __error:Sound = new AllMySounds.ERROR;
		private var __shoot:Sound = new AllMySounds.SHOT;
		private var __explosion:Sound = new AllMySounds.POP;
		private var __ps:PDParticleSystem;
		private var _gameAlive:Boolean = true;
		private var _bgMusic:Sound;
		private var _mySoundChannel:SoundChannel;
		public function Game()
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, setStage);
			addEventListener(Event.ADDED_TO_STAGE, gameMode);
		
		}
		
		
		private function gameStart():void
		{
			
		}
		
		
		private function gameMode():void
		{
			
			__battleField = new Sprite(); 
			addChild( __battleField );
			
			for (var i:int = 0; i < __numberOfShips; i++) 
			{
				var ship:Ship =  new Ship(true);
				__battleField.addChild( ship );
				__currentQuestions.push(ship._question);
				__answersArray.push(ship._answer);
				__shipArray.push( ship );
			}// end for i loop 
			
			for (var j:int = 0; j < 100; j++) 
			{
				var bullet:Bullet = new Bullet();
				__bulletArray.push( bullet );
			}
			__turret = new Turret();
			__battleField.addChild( __turret );
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			__battleField.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			var h:uint = 0;
			for each (var q:String in __currentQuestions) 
			{
				trace(q+" :"+__answersArray[h]);
				h++;
			}
		}
		
		private function setStage():void
		{
			__gameStage = new GameStage();
			addChild( __gameStage );
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
				__userAnswer += character;
				
				if (e.keyCode == 8)
				{
					__userAnswer = "";
				}
				
			}// end if 

			if (e.keyCode == 32 || e.keyCode == 13) // spacebar
			{
				var answerCheck:Boolean = false;
				for each (var s:Ship in __shipArray) 
				{
						
						if (Number(__userAnswer) == s._answer)
						{
							trace("correct");
							__turret._firing = true;
							if (s._alive)
							{
								// adding the current bullet to the stage 
								__bulletArray[__bulletCounter].x = 240;
								__bulletArray[__bulletCounter].y = 690;
								__bulletArray[__bulletCounter]._bulletTarget = s;
								__bulletArray[__bulletCounter]._alive = true;
								__battleField.addChild( __bulletArray[__bulletCounter] );
								__bulletCounter ++;
								__shoot.play();
								__turret._rads = s._rads;
							}
							
							if (__bulletCounter > 100)// look into fixing this 
							{
								__bulletCounter = 0;
							}
							answerCheck = true;
						}// end number = answer
						
				}// end space bar loop 
				
						if (!answerCheck)
						{
							trace("noise");
							__error.play();
						}
				__userAnswer = "";
			}
		}		
		private function onEnterFrame():void
		{
			__turret.firing();
			__gameStage._score   = __totalScore;
			// ship for each loop. Tracking allships
			for each (var s:Ship in __shipArray) 
			{
				var distX:Number;
				var distY:Number;
					for each( var ship2:Ship in __shipArray)
					{
						distX = ShipDistanceCalculator.getX(s, ship2);
						distY = ShipDistanceCalculator.getY(s, ship2);
						
						if(s != ship2){
							if (distX < 50 && distY < 50)
							{
								if (s.x > ship2.x)
								{
									s.x += 1;
									ship2.x -= 1;
								}
								else
								{
									s.x -= 1;
									ship2.x += 1;
								}
							}
						}
					}
				if(s._alive)
				{
					s.shipMove();
					__distanceY = __turret.y - s.y;
					__distanceX = __turret.x - s.x;
					if (__distanceY <= 5 && __distanceX <= 5)
					{
						trace("game resseting for some reasaon");
						__totalScore = 0;
						__numberOfShips = 1;
						
						resetGame();
					}
					for each (var b:Bullet in __bulletArray) 
					{
						__gameStage._answer= __userAnswer;
						__gameStage.updateAnswer();
						
						b.bulletTargetingSysetm();
						  
						if(__distanceY < 0)
						{
							__distanceY *= -1;
						}
						
						if ((b._distanceX <= 2 || b._distanceY <=2) && b._alive)
						{
							targetHit( b );
							b.bulletDeath();
						}
						
						if (s.y >= 670)
						{
							_gameAlive = false;
							gameOver();
						}
					}// end for each loop 
				}
			}// end for each loop 
			if (__shipArray.length == __score && _gameAlive)
			{
				__score = 0;
				__gameStage._waveNumber += 1;
				resetGame();
				
			}
		} // End event enter frame 
		private function targetHit(b:Bullet):void
		{
			var psConfig:XML = XML(new  AllMyParticles.EXPLOSION_CONFIG() );
			var psTexture:Texture = Texture.fromBitmap(new AllMyParticles.EXPLOSION());
			var psConfig2:XML = XML(new AllMyParticles.EXPLOSION_CONFIG() );
			var psTexture2:Texture = Texture.fromBitmap(new AllMyParticles.EXPLOSION());
			__ps = new PDParticleSystem(psConfig, psTexture);	
			__ps.x = 0;
			__ps.y = 0;
			addChild( __ps );
			Starling.juggler.add( __ps );
			__ps.emitterX = b.x;
			__ps.emitterY = b.y;
			__ps.start(.01);
			__explosion.play();
			
			if(b._bulletTarget._alive){
				__battleField.removeChild( b._bulletTarget );
				__battleField.removeChild( b );
				
				__score ++; 
				__totalScore ++;
				b._bulletTarget._alive = false;
			}
		}
		private function resetGame():void
		{
			trace("game reset");
			__answersArray      = [];
			__bulletArray 		= [];
			__currentQuestions 	= [];
			__shipArray 		= [];
			while( __battleField.numChildren > 0)
			{
				__battleField.removeChildAt(0);8 
			}
			__battleField.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			__numberOfShips++;
			gameMode();
		}
		private function gameOver():void
		{
			__gameStage.stopMusic();	
			__answersArray      = [];
			__bulletArray 		= [];
			__currentQuestions 	= [];
			__shipArray 		= [];
			while( __battleField.numChildren > 0)
			{
				__battleField.removeChildAt(0);
			}
			removeChild(__gameStage);
			__battleField.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			dispatchEvent(new ScreenEvent(ScreenEvent.CHANGE_SCREEN, "run game"));	
		}
	}
}