package com.wbarra.game.objects
{
	import com.wbarra.utilityBuilder.QuestionBuilder;
	
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class Ship extends Sprite
	{
		
		private var _builtQuestion:String = "";
		private var _shipAlive:Boolean;
		private var _shipAnswer:Number;
		private var _newShipX:Number;		
		private var _newShipY:Number;
		private var _changeX:Number;
		private var _changeY:Number;
		private var _shipAngle:Number;
		private var _shipRads:Number;
		private var _shipSpeed:Number = 1;
		private var _enemyEquation:TextField;
		
		public function Ship(alive:Boolean)
		{
			super();
			_shipAlive = alive;
			
			x = Math.random()*480;
			y = -10 + (Math.random()*-50);
			_enemyEquation = new TextField(100, 50, "1 + 1:");
			_enemyEquation.color = 0xFFFFFF;
			_enemyEquation.x = -50;
			_enemyEquation.y = -25;
			addChild(_enemyEquation);
			buildQuestions();
		}

		public function get _speed():Number
		{
			return _shipSpeed;
		}
		public function set _speed(value:Number):void
		{
			_shipSpeed = value;
		}
		public function set _alive(value:Boolean):void
		{
			_shipAlive = value;
		}
		public function get _alive():Boolean
		{
			return _shipAlive;
		}
		public function get _newY():Number
		{
			return _newShipY;
		}
		public function get _newX():Number
		{
			return _newShipX;
		}
		public function get _answer():int
		{
			return _shipAnswer;
		}
		public function get _question():String
		{
			return _builtQuestion;
		}
		private function buildQuestions():void
		{
			var questionBuilder:QuestionBuilder = new QuestionBuilder();
			questionBuilder.buildMyQuestion();
			_shipAnswer = questionBuilder._myAnswer;
			_enemyEquation.text = questionBuilder._myQuestion;
		}		
		public function shipMove():void
		{
			if (_shipAlive)
			{
				_changeX = 210 -x;
				_changeY = 680 - y;
				_shipAngle = Math.atan2(_changeY, _changeX) * ( 180/ Math.PI);
				_shipRads = _shipAngle * Math.PI/ 180;
				x += Math.cos(_shipRads) * _shipSpeed;
				y += Math.sin(_shipRads) * _shipSpeed;
				_newShipX = x;
				_newShipY = y;
			}
			else
			{
				_shipSpeed = 0;
			}
			
		}
		public function shipDeath():void
		{
			_shipAlive = false;			
		}
	}
}