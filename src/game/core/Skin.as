package game.core 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mike email:542540443@qq.com
	 */
	public class Skin extends Bitmap 
	{
		public static const BIG_ALPHA:int = 255
		
		public function Skin(texture:BitmapData = null) 
		{
			super(null, "auto", true);
			setTexture(texture);
		}
		
		public function setTexture(bit:BitmapData):void
		{
			if (bit == this.bitmapData) return;
			this.dispose();
			this.bitmapData = bit;
		}
		
		public function dispose():void
		{
			if (this.bitmapData) {
				this.bitmapData.dispose();
				this.bitmapData = null;
			}
		}
		
		public function isTextrue():Boolean
		{
			return this.bitmapData != null;
		}
		
		//精确碰撞,必须同一节点下
		public function hitPixel(skin:Skin):Boolean
		{
			if (this.isTextrue() && skin.isTextrue()) {
				return this.bitmapData.hitTest(getPoint(), BIG_ALPHA, skin, skin.getPoint(), BIG_ALPHA);
			}
			return false;
		}
		
		public function removeFromParent(cleanup:Boolean = true):void
		{
			if (parent) parent.removeChild(this);
			if(cleanup) this.dispose();
		}
		
		public function getPoint():Point
		{
			return new Point(x, y);
		}
		
		//end
	}

}