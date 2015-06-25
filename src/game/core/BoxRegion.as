package game.core 
{
	import flash.filters.GlowFilter;
	import game.physics.IRegion;
	
	/**
	 * ...
	 * @author Mike email:542540443@qq.com
	 */
	public class BoxRegion extends SkinBox implements IRegion 
	{
		
		public function BoxRegion(skin:Skin = null) 
		{
			super(skin);
		}
		
		/* INTERFACE game.physics.IRegion */
		public function setPositionX(value:Number):void
		{
			x = value;
		}
		
		public function setPositionY(value:Number):void
		{
			y = value;
		}
		
		public function getPositionX():Number
		{
			return x;
		}
		
		public function getPositionY():Number
		{
			return y;
		}
		
		public function get type():int 
		{
			return 0;
		}
		
		public function get left():Number 
		{
			return x;
		}
		
		public function get right():Number 
		{
			return x + width;
		}
		
		public function get top():Number 
		{
			return y;
		}
		
		public function get bottom():Number 
		{
			return y + height;
		}
		
		public function isMiddleY(value:IRegion):Boolean
		{
			if (value.bottom <= this.top) return false;
			if (value.top >= this.bottom) return false;
			return true;
		}
		
		public function isMiddleX(value:IRegion):Boolean
		{
			if (this.left >= value.right) return false;
			if (value.left >= this.right) return false;
			return true;
		}
		
		//被瞄准
		public function onTakeAim(target:IRegion):void
		{
			this.filters = [new GlowFilter(0xff0000)];
		}
		
		public function onHitRegion(type:int, value:IRegion):void
		{
			
		}
		//end
	}

}