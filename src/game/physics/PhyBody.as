package game.physics 
{
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	import flash.geom.Rectangle;
	
	/**
	 * ...只做物理测试，不做旋转以及变形处理
	 * ...这里只做横版
	 * @author Mike email:542540443@qq.com
	 */
	public class PhyBody
	{
		private static const NONE:int = 0;
		private var _user:IRegion;
		//
		public var wallopx:Number; 						//x冲击力
		public var wallopy:Number; 						//x冲击力
		public var friction:Number;						//摩擦力
		public var inertia:Number;						//惯性值
		public var strength:Number;						//抗击力
		//
		public const gravity:Number = 0.98;				//重力加速度
		public var omitGravity:Boolean = false;			//是否忽略重力
		
		public function PhyBody(user:IRegion = null) 
		{
			setUser(user);
		}
		
		//设置对象清空
		public function setUser(user:IRegion):void
		{
			restore();
			_user = user;
		}
		
		public function get data():IRegion
		{
			return _user;
		}
		
		//恢复初始，也就是禁止
		public function restore():void
		{
			wallopx = 0;
			wallopy = 0;
			inertia = 0;
			friction = 0;
			strength = 0;
		}
		
		//最终渲染和行为有关系
		public function endRender(lumps:Array, checkType:int = CheckType.ALL):void
		{
			switch(checkType)
			{
				case CheckType.ALL:		
					
					checkX(lumps);	
					checkY(lumps);
				break;
				case CheckType.DROP:
					
				break;	
			}
		}
		
		//X轴判断
		private function checkX(lumps:Array):void
		{
			if (wallopx == NONE) return;
			var dot:IRegion = null;
			var nearby:IRegion = null;
			var endValue:Number = data.x + wallopx;
			if (wallopx > NONE) {
				lumps.sortOn("left", Array.NUMERIC);
				//trace("move right")
				for (var i:int = 0; i < lumps.length; i++) {
					dot = lumps[i];
					if (dot.left >= data.right && dot.isMiddleY(data)) {
						nearby = dot;
						Sprite(dot).filters = [new GlowFilter(0xff0000)];
						break;
					}
				}
				if (nearby && data.right + wallopx > nearby.left) endValue = nearby.left - data.width;
			}else {
				lumps.sortOn("right", Array.NUMERIC);
				//trace("move left")
				for (var k:int = lumps.length - 1; k >= 0 ; k--) {
					dot = lumps[k];
					if (data.left >= dot.right && dot.isMiddleY(data)) {
						nearby = dot;
						Sprite(dot).filters = [new GlowFilter(0xff0000)];
						break;
					}
				}
				if (nearby && data.left + wallopx < nearby.right) endValue = nearby.right;
			}
			//
			data.x = endValue;
		}
		
		//Y轴判断
		private function checkY(lumps:Array):void
		{
			if (wallopy == NONE) return;
			var dot:IRegion = null;
			var nearby:IRegion = null;
			var endValue:Number = data.y + wallopy;
			if (wallopy > NONE) {
				lumps.sortOn("top", Array.NUMERIC);
				//trace("move down")
				for (var i:int = 0; i < lumps.length; i++) {
					dot = lumps[i];
					if (dot.top >= data.bottom && dot.isMiddleX(data)) 
					{
						nearby = dot;
						Sprite(dot).filters = [new GlowFilter(0xff0000)];
						break;
					}
				}
				if (nearby && data.bottom + wallopy > nearby.top) endValue = nearby.top - data.height;
			}else {
				lumps.sortOn("bottom", Array.NUMERIC);
				//trace("move up")
				for (var k:int = lumps.length - 1; k >= 0; k--) {
					dot = lumps[k];
					if (data.top >= dot.bottom && dot.isMiddleX(data)) 
					{
						nearby = dot;
						Sprite(dot).filters = [new GlowFilter(0xff0000)];
						break;
					}
				}
				if (nearby && data.top + wallopy < nearby.bottom) endValue = nearby.bottom;
			}
			//
			data.y = endValue;
		}
		//end
	}

}