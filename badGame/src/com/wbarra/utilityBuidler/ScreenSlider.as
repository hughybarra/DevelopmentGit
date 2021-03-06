package com.wbarra.utilityBuidler
{
	import com.wbarra.imagesAndSound.AllMyImages;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class ScreenSlider extends Sprite
	{
		private var _swapper:Boolean;
		private var _starlingLogo:Image;
		private var _squareLogo:Image;
		private var _swapStage:Sprite;
		
		public function ScreenSlider()
		{
			super();
			_swapStage = new Sprite();
//			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
			this.addEventListener(Event.ADDED_TO_STAGE, doStuff);
		}
		public function changeLogo():void
		{
			if (_swapper)
			{
				_starlingLogo.alpha -= .01;
				_squareLogo.alpha += .01;
			}
			else
			{
				_squareLogo.alpha -= .01;
				_starlingLogo.alpha += .01;
			}
			
		}
		public function set swapper(value:Boolean):void
		{
			_swapper = value;
		}
		private function doStuff():void
		{
			addChild(_swapStage);
			
		
			_starlingLogo= Image.fromBitmap( new AllMyImages.LOGO_STARLING());
			_starlingLogo.x = 25;
			_starlingLogo.y = 25;
			_starlingLogo.alpha = 0;
			_swapStage.addChild( _starlingLogo );
			
			_squareLogo = Image.fromBitmap( new AllMyImages.LOGO_71_SQRD());
			_squareLogo.x = -125;
			_squareLogo.y = 25;
			_squareLogo.alpha = 0;
			_swapStage.addChild( _squareLogo );
		}
		public function logoMove():void
		{
			if(_swapper)
			{
				_starlingLogo.alpha += .1;
				_squareLogo.alpha -= .1;
			}
			else
			{
				_starlingLogo.alpha -= .1;
				_squareLogo.alpha += .1;
			}
		}
	}
}