package
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.*;
	
	/**
	 * ...
	 * @author Kazuhiro
	 */
	public class GameMain extends Sprite
	{
		[Embed(source = "../resource/bg.png")]
		private var bgPNG:Class;
		
		private var _fieldX:Number;
		private var _fieldY:Number;
		
		private var player:Player;
		private var srcbd:BitmapData;
		private var bd:BitmapData;
		private var tx:Number=0;

		public function GameMain() 
		{ 			
			addEventListener(Event.ADDED_TO_STAGE, addedStage);
			super();
		}

		private function addedStage(e:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.addEventListener(MouseEvent.CLICK, onMouseClick);
			_fieldX = 800;
			_fieldY = 400;

			var bg:Bitmap = new bgPNG() as Bitmap;
			srcbd = bg.bitmapData;
			bd = new BitmapData(_fieldX,_fieldY);
			bd.copyPixels(srcbd, new Rectangle(0,0,_fieldX,_fieldY), new Point());
			addChild(new Bitmap(bd));
			
			AnimSprite.stage = stage;
			player = new Player();
			addChild(player);
			addEventListener(Event.ENTER_FRAME, loop);
			
			player.x = 400;
			player.y = 280;

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
			var tx:Number = player.speed;
			var copybd:BitmapData = srcbd.clone();
			srcbd.scroll(tx,0);
			srcbd.copyPixels(copybd, new Rectangle(1600 - tx, 0, tx, _fieldY), new Point());
			bd.copyPixels(srcbd, new Rectangle(0,0,_fieldX,_fieldY), new Point());
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