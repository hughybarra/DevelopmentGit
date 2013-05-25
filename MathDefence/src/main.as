package 
{
	import com.wbarra.controller.ScreenNavigator;
	
	import flash.display.Sprite;
	import flash.events.ContextMenuEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
	import starling.core.Starling;
	
	[SWF(width="512", height="768", frameRate="60", backgroundColor="#000000")]
	
	public class main extends Sprite
	{
		
		private var mStarling:Starling;
		private var _mStarling:Starling;
		
		public function main()
		{
			
			var my_menu:ContextMenu = new ContextMenu();
			my_menu.hideBuiltInItems();
			
			
			var developerNotice:ContextMenuItem = new ContextMenuItem("Developed and Designed by Hugh Ybarra");
			developerNotice.enabled = false;
			my_menu.customItems.push(developerNotice);
			
			var siteNotice:ContextMenuItem = new ContextMenuItem("http://www.wbarra.com");
			my_menu.customItems.push(siteNotice);
			
			function openLink(e:ContextMenuEvent):void
			{
				navigateToURL(new URLRequest("http://www.wbarra.com"));
			}
			siteNotice.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, openLink);
			
			var copyNotice:ContextMenuItem = new ContextMenuItem("Copyright - 2013");
			copyNotice.enabled = false;
			my_menu.customItems.push(copyNotice);
			contextMenu = my_menu;
			
			mStarling = new Starling(ScreenNavigator, stage);
			mStarling.start();
		}
	}
}
