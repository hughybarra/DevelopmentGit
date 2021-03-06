package com.wbarra.screens
{
	import com.wbarra.events.ScreenEvent;
	import com.wbarra.imagesAndSound.AllMyImages;
	import com.wbarra.utilityBuidler.ScreenSlider;
	
	import flash.events.TimerEvent;
	import flash.text.Font;
	import flash.utils.Timer;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.extensions.PDParticleSystem;
	import starling.text.TextField;
	import starling.utils.HAlign;
	
	public class GameStart extends Sprite
	{
		private var _startButton:Image;
		
	
		private var _ps:PDParticleSystem;
		private var _timer:Boolean = true;
		private var _slider:ScreenSlider;
		private var _myTimer:Timer;
		private var _alpha:Font = new AllMyImages.Alpha();
		
		public function GameStart()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, runStart);
			this.addEventListener(Event.ADDED_TO_STAGE, timeEvent);
			this.addEventListener(Event.ADDED_TO_STAGE, onImageCreation);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onImageCreation():void
		{
			_slider = new ScreenSlider();
			addChild(_slider);
		}
		private function onEnterFrame():void
		{
			_slider.changeLogo();
		}
		private function timeEvent():void
		{
				_myTimer= new Timer(05000, 1);
				_myTimer.addEventListener("timer", timerHandler);
				_myTimer.start();
		}
		
		
		public function timerHandler(event:TimerEvent):void {
			
			if (_timer)
			{
				_slider.swapper = _timer;
				_timer = false;
			}
			else 
			{
				_slider.swapper = _timer;
				_timer = true;
			} 
			_myTimer.repeatCount = 0;
			
		}
		private function runStart():void
		{
			
			
			var startBox:TextField = new TextField(300, 100,"PRESS START", "alpha", 30);
			startBox.border = true;
			startBox.x = 150 ;
			startBox.y = 375;
			startBox.color = 0xFFFFFF;
			addChild(startBox);
			
			var gameTitle:TextField = new TextField(300, 100, "MATH DEFNSE", "alpha", 40);
			gameTitle.x = 150;
			gameTitle.y = 300;
			gameTitle.color = 0xFFFFFF;
			addChild(gameTitle);
			
			var bottomText:TextField = new TextField(400, 50, "Concept, Graphics & Programming: Hugh Ybarra");
			bottomText.x = 5;
			bottomText.y = 725;
			bottomText.color = 0xFFFFFF;
			bottomText.hAlign = HAlign.LEFT;
			addChild(bottomText);
			
			
			_startButton= Image.fromBitmap(new AllMyImages.EMPTY());
			_startButton.x = 256 - _startButton.width/2;
			_startButton.y = 384 - _startButton.height/2;
			addChild( _startButton );
			
			_startButton.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		private function onTouch(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN)
			if (touch)
			{
				dispatchEvent(new ScreenEvent(ScreenEvent.CHANGE_SCREEN, "game screen"));	
				removeEventListener(TouchEvent.TOUCH, onTouch);
				removeChild(_startButton);
			}
		}
	
	}
}