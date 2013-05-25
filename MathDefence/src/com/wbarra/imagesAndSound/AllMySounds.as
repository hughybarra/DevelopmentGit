package com.wbarra.imagesAndSound
{
	import flash.media.Sound;
	
	public class AllMySounds extends Sound
	{
		[Embed(source="sounds/DST-impuretechnology.mp3")]
		public static const BG_MUSIC:Class;
		
		[Embed(source="sounds/shot.mp3")]
		public static const SHOT:Class;
		
		[Embed(source="sounds/error.mp3")]
		public static const ERROR:Class;
		
		[Embed(source="sounds/pop.mp3")]
		public static const POP:Class;
		
		
		
		public function AllMySounds()
		{
			super();
			
		}
	}
}