package game 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.ui.KeyboardType;
	import flash.utils.getTimer;
	import game.core.BoxRegion;
	import game.core.Skin;
	import game.core.SkinBox;
	import game.physics.PhyBody;
	/**
	 * ...
	 * @author Mike email:542540443@qq.com
	 */
	public class Main extends Sprite
	{
		private var _list:Array;
		private var _self:PhyBody;
		
		public function Main() 
		{
			stage?init():addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			//
			createList();
			//
			var spt:BoxRegion = new BoxRegion(new Skin(new BitmapData(10, 10, true, 0xffff0000)));
			spt.x = 500;
			spt.y = 200;
			this.addChild(spt);
			_self = new PhyBody(spt);
			//
			setRunning();
		}
			
		private function createList():void
		{
			_list = new Array;
			for (var i:int = 0; i < 400; i++)
			{
				var spt:BoxRegion = new BoxRegion(new Skin(new BitmapData(Math.random() * 40 + 10, Math.random() * 20 + 10, false, 0)));
				spt.x = Math.random() * stage.stageWidth;
				spt.y = Math.random() * stage.stageHeight;
				this.addChild(spt);
				_list.push(spt);
			}
		}
		
		public function setRunning():void
		{
			this.addEventListener(Event.ENTER_FRAME, runEvent);
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyDown);
		}
		
		private function onKeyDown(event:KeyboardEvent):void
		{
			if (event.type == KeyboardEvent.KEY_UP) {
				if (event.keyCode == Keyboard.A||event.keyCode == Keyboard.D) _self.wallopx = 0;
			}else {
				const speed:int = 2
				if (event.keyCode == Keyboard.A) {
					_self.wallopx = -speed;
				}
				if (event.keyCode == Keyboard.D) {
					_self.wallopx = speed;
				}
				if (event.keyCode == Keyboard.W) {
					//if (_self.wallopy > 0) return;
					_self.setThrust(20);
				}
				//
			}
		}
		
		private function runEvent(event:Event):void
		{
			for each(var obj:BoxRegion in _list) {
				obj.filters = null;
			}
			_self.endRender(_list);
		}
		
		//end
	}

}