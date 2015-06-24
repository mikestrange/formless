package game.physics 
{
	
	/**
	 * ...
	 * @author Mike email:542540443@qq.com
	 */
	public interface IRegion 
	{
		function set x(value:Number):void;
		function set y(value:Number):void;
		function get x():Number;
		function get y():Number;
		function get width():Number;
		function get height():Number;
		//区域类型
		function get type():int;
		//四个点
		function get left():Number;
		function get right():Number;
		function get top():Number;
		function get bottom():Number;
		//
		function isMiddleY(value:IRegion):Boolean;
		function isMiddleX(value:IRegion):Boolean;
		//end
	}
	
}