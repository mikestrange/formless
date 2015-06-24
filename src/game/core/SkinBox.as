package game.core 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import game.core.Skin;
	import game.physics.IRegion;
	
	/**
	 * ...
	 * @author Mike email:542540443@qq.com
	 */
	public class SkinBox extends Sprite
	{
		private var skinContent:Skin = null;
		
		public function SkinBox(skin:Skin = null) 
		{
			setSkin(skin);
		}
		
		public function cleanSkin():void
		{
			if (skinContent) {
				skinContent.removeFromParent();
				skinContent = null;
			}
		}	
		
		//皮肤必须置于最底层
		public function setSkin(skin:Skin):void
		{
			if (skin == skinContent) return;
			this.cleanSkin();
			if (skin) {
				skinContent = skin;
				this.addChild(skin);
			}
		}
		
		public function setTexture(bit:BitmapData):void
		{
			if (skinContent) skinContent.setTexture(bit);
		}
		
		public function getSkin():Skin
		{
			return skinContent;
		}
		
		public function hitSkin(skin:Skin):Boolean
		{
			if (skinContent && skin) {
				return skinContent.hitPixel(skin)
			}
			return false;
		} 
		
		
		
		//end
	}

}