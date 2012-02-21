package  
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	
	public class Player extends AnimSprite
	{
		[Embed(source = "../resource/girl.png")] private var CharacterPNG:Class;
		private const FRAME_RATE:Number = 10.0;
		private var speed:Number = 0;
		
		
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
			if (Key.keys[Key.SPACE])
			{
				play("left");
				if (speed < 20) speed++;
			}
			else
			{
				play("charge");
				if (speed > 0) speed--;
			}
			
			//this.x -= speed;
 
			super.update();
		}
	}
}