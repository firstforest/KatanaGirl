package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Kazuhiro
	 */
	public class GameMain extends Sprite
	{
		private var keys:Array;
		private var _fieldX:Number;
		private var _fieldY:Number;
		
		public function GameMain()
		{
			keys = [];

			addEventListener(Event.ENTER_FRAME, loop);
			addEventListener(Event.ADDED_TO_STAGE, addedStage);

			super();
		}

		private function addedStage(e:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.addEventListener(MouseEvent.CLICK, onMouseClick);
			_fieldX = 600;
			_fieldY = stage.stageHeight;
		}
		
		private function onMouseClick(e:MouseEvent):void 
		{

		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			keys[e.keyCode] = true;
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			keys[e.keyCode] = false;
		}
		
		private function loop(e:Event):void
		{

		}
	
		public function get fieldX(): Number
		{
			return _fieldX;
		}
		
		public function get fieldY():Number 
		{
			return _fieldY;
		}
	
	}

}