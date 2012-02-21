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
		private var _fieldX:Number;
		private var _fieldY:Number;
		
		private var player:Player;
		
		public function GameMain() 
		{
 			
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
			
			graphics.beginFill(0x0);
			graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			graphics.endFill();
			
			AnimSprite.stage = stage;
			player = new Player();
			addChild(player);
			
			player.x = 200 * 2;
			player.y = 200 * 2;

		}
		
		private function onMouseClick(e:MouseEvent):void 
		{

		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			Key.keys[e.keyCode] = true;
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			Key.keys[e.keyCode] = false;
		}
		
		private function loop(e:Event):void
		{
			player.update();
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