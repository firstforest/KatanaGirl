package  
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	
	public class Player extends AnimSprite
	{
		[Embed(source = "../resource/girl.png")]
		private var CharacterPNG:Class;
		private const FRAME_RATE:Number = 10.0;
		public var speed:Number = 0;
		private var pSpeed:Number = 0;
		private var atk:int = 10;
		
		
		private static const FIRST_MAX_SPEED:Number = 100;
		private static const SECOND_MAX_SPEED:Number = 200;
		private static const THRID_MAX_SPEED:Number = 400;
		
		public function Player()
		{
			var bitmap:Bitmap = new CharacterPNG() as Bitmap;
			super(bitmap.bitmapData, 200, 200);
			
			addAnimation("left", [5,6,7], FRAME_RATE);
			addAnimation("charge", [10], FRAME_RATE);
			addAnimation("maxSpeed", [10], FRAME_RATE);
			addAnimation("idle", [0], 0, false);
			play("idle");
		}
 
		public function getAtk():int
		{
			return atk;
		}
		
		override public function update():void 
		{
			if (Key.keys[Key.SPACE] || Key.keys[Key.LEFT])
			{
				pSpeed ++;
				if (pSpeed < FIRST_MAX_SPEED-3)
				{
					play("left");
					speed = 10;
				}
				else if (pSpeed < FIRST_MAX_SPEED)
				{
					speed = 1;
				}	
				else if (pSpeed < SECOND_MAX_SPEED-3)
				{
					play("left");
					speed = 20;
				}
				else if (pSpeed < SECOND_MAX_SPEED)
				{
					speed = 1;
				}
				else if (pSpeed < THRID_MAX_SPEED-3)
				{
					play("left");
					speed = 40;
				}
				else if (pSpeed < THRID_MAX_SPEED)
				{
					speed = 1;
				}
				else
				{
					pSpeed = THRID_MAX_SPEED;
					speed = 40;
					play("maxSpeed");
				}
				
 			}
			else
			{
				play("charge");
				if (pSpeed > 0) pSpeed--;
				if (speed > 0)
				{
					speed--;
				}
				else
				{
					pSpeed = 0;
				}
			}
 
			super.update();
		}

	}
}