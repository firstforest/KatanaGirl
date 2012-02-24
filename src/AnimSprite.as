package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.geom.Rectangle;
 
	public class AnimSprite extends Sprite
	{
		public static var stage:Stage;
		public static const ZERO:Point = new Point();
		public var curAnim:Anim;
		public var animGroup:Array = [];
		public var finished:Boolean = false;
		public var time:Number = 0.0;
		public var chip:BitmapData;
		public var chipWidth:Number;
		public var chipHeight:Number;
		public var xLength:int;
		public var bitmap:Bitmap;
 
		public function AnimSprite(chip:BitmapData, width:Number, height:Number)
		{
			this.chip = chip;
			this.chipWidth = width;
			this.chipHeight = height;
			this.xLength = chip.width / width;
 
			var bd:BitmapData = new BitmapData(width, height, true, 0x0);
			addChild(bitmap = new Bitmap(bd));
			super();
		}
 
		public function addAnimation(name:String, frames:Array, delay:Number, looped:Boolean = true):void
		{
			animGroup.push(new Anim(name, frames, 0, 1.0 / delay, looped));
		}
 
		public function play(name:String, force:Boolean = false):void
		{
			if (!force && curAnim != null && curAnim.name == name && (curAnim.looped || !finished)) return;
			
			for each (var anim:Anim in animGroup)
			{
				if (anim.name == name)
				{
					curAnim = anim;
					finished = false;
					time = 0.0;
					break;
				}
			}
		}
 
		public function update():void
		{
			bitmap.bitmapData.fillRect(bitmap.bitmapData.rect, 0x0);
			if (curAnim)
			{
				var tx:int = curAnim.frames[curAnim.index] % xLength;
				var ty:int = curAnim.frames[curAnim.index] / xLength;
				bitmap.bitmapData.copyPixels(chip, new Rectangle(tx * chipWidth, ty * chipHeight, chipWidth, chipHeight), ZERO);
			}
			if (curAnim && curAnim.delay > 0 && (curAnim.looped || !finished))
			{
				time += 1 / AnimSprite.stage.frameRate;
				while (time > curAnim.delay)
				{
					time -= curAnim.delay;
 
					if (curAnim.index >= curAnim.frames.length - 1)
					{
						finished = true;
						if (curAnim.looped) curAnim.index = 0;
					}
					else curAnim.index++;
				}
			}
		}
	}
}