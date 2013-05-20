package com.wbarra.game.objects
{
	import com.wbarra.utilityBuilder.QuestionBuilder;
	
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class Ship extends Sprite
	{
		
		private var __question:String = "";
		private var __alive:Boolean;
		private var __answer:Number;
		private var __newX:Number;		
		private var __newY:Number;
		private var __changeX:Number;
		private var __changeY:Number;
		private var __angle:Number;
		private var __rads:Number;
		private var __speed:Number = .5;
		private var __shipID:uint;
		private var __enemyEquation:TextField;
		
		public function Ship(alive:Boolean,__shipID)
		{
			super();
			__alive = alive;
			
			x = Math.random()*480;
			y = -10 + (Math.random()*-50);
			__enemyEquation = new TextField(100, 50, "1 + 1:");
			__enemyEquation.color = 0xFFFFFF;
			__enemyEquation.x = -50;
			__enemyEquation.y = -25;
			addChild(__enemyEquation);
			buildQuestions();
		}

		public function get _speed():Number
		{
			return __speed;
		}
		public function set _speed(value:Number):void
		{
			__speed = value;
		}
		public function set _alive(value:Boolean):void
		{
			__alive = value;
		}
		public function get _alive():Boolean
		{
			return __alive;
		}
		public function get _newY():Number
		{
			return __newY;
		}
		public function get _newX():Number
		{
			return __newX;
		}
		public function get _answer():int
		{
			return __answer;
		}
		public function get _question():String
		{
			return __question;
		}
		public function buildQuestions():void
		{
			var questionBuilder:QuestionBuilder = new QuestionBuilder();
			questionBuilder.buildMyQuestion();
			__answer = questionBuilder._myAnswer;
			__enemyEquation.text = questionBuilder._myQuestion;
		}		
		public function shipMove():void
		{
			__changeX = 210 -x;
			__changeY = 680 - y;
			__angle = Math.atan2(__changeY, __changeX) * ( 180/ Math.PI);
			__rads = __angle * Math.PI/ 180;
			x += Math.cos(__rads) * __speed;
			y += Math.sin(__rads) * __speed;
			__newX = x;
			__newY = y;
		}
		public function shipDeath():void
		{
			__alive = false;			
		}
	}
}