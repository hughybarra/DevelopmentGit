package com.wbarra.utilityBuilder
{
	public class QuestionBuilder
	{
		private const PEMDOS_ARRAY:Array = [ "*", "+"];
		private var __myQuestion:String;
		private var __myAnswer:int;
		
		public function QuestionBuilder()
		{
			buildMyQuestion();
		}

		public function get _myQuestion():String
		{
			return __myQuestion;
		}

		public function get _myAnswer():Number
		{
			return __myAnswer;
		}

		public  function buildMyQuestion():void
		{
			var numOne:int = Math.random()* 10;
			var numTwo:int = Math.random()* 10;
			
			var arraySetter:uint = Math.random()*2;
			var operatorType:String = PEMDOS_ARRAY[arraySetter];
			var question:String;
			var answer:Number;
			
			if (operatorType == "*")
			{
				question = "" + numOne + " * " + numTwo;
				answer   = numOne * numTwo;
				
			}
//			else if (operatorType == "/")
//			{
//				question = "" + numOne + " / " + numTwo;
//				answer   = numOne / numTwo;
//				
//				if (answer % 2 != 0 || answer < 0)
//				{
//					buildMyQuestion();
//				}
//				
//			}
			else if (operatorType == "+")
			{
				question = "" + numOne + " + " + numTwo;
				answer   = numOne + numTwo;
			}
//			else if (operatorType == "-")
//			{
//				question = "" + numOne + " - " + numTwo;
//				answer   = numOne - numTwo;
//			}
			if (answer > 100 || answer <= 0)
			{
				buildMyQuestion();
			}
			
			__myQuestion = question;
			__myAnswer = answer;
			
		}
	}
}