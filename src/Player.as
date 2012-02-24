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
		
		private static const FIRST_MAX_SPEED:Number = 10;
		private static const SECOND_MAX_SPEED:Number = 20;
		private static const THRID_MAX_SPEED:Number = 40;
		
		public function Player()
		{
			var bitmap:Bitmap = new CharacterPNG() as Bitmap;
			super(bitmap.bitmapData, 200, 200);
			
			addAnimation("left", [1,2], FRAME_RATE);
			addAnimation("charge", [0], FRAME_RATE);
			addAnimation("idle", [0], 0, false);
			play("idle");
		}
 
		override public function update():void 
		{
			if (Key.keys[Key.SPACE] || Key.keys[Key.LEFT])
			{
				if (speed < 1) speed = 1;
				play("left");
				if (speed < FIRST_MAX_SPEED)
				{
					if (speed < FIRST_MAX_SPEED * 0.77)
					{
						speed += 0.01;
					}
					else
					{
						play("charge");
						speed = FIRST_MAX_SPEED;
					}
					
				}
				else if (speed < SECOND_MAX_SPEED)
				{
					if (speed < SECOND_MAX_SPEED * 0.77)
					{
						speed += 0.01;
					}
					else
					{
						play("charge");
						speed = SECOND_MAX_SPEED;
					}
				}
				else if (speed < THRID_MAX_SPEED)
				{
					if (speed < THRID_MAX_SPEED*0.77)
					{
						speed += 0.01;
					}
					else
					{
						play("charge");
						speed = THRID_MAX_SPEED;
					}
				}
				else
				{
					play("charge");
				}
				
 			}
			else
			{
				play("charge");
				if (speed > 0) speed-=0.3;
			}
 
			super.update();
		}
	}
}