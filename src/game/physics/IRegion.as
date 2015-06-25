package game.physics 
{
	
	/**
	 * ...
	 * @author Mike email:542540443@qq.com
	 */
	public interface IRegion 
	{
		function setPositionX(value:Number):void;
		function setPositionY(value:Number):void;
		function getPositionX():Number;
		function getPositionY():Number;
		//
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
		//被瞄准
		function onTakeAim(target:IRegion):void;
		//触碰或者是到达
		function onHitRegion(type:int, value:IRegion):void;
		//end
	}
	
}