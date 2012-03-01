package 
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import flash.display.*;


public class Enemy extends AnimSprite
{

	public function Enemy()
	{
		var tSprite:Sprite = new Sprite();
		tSprite.graphics.beginFill(0x550000);
		tSprite.graphics.drawCircle(150,150,50);
		tSprite.graphics.endFill();
		var shape:BitmapData = new BitmapData(200,200,true,0x0);
		shape.draw(tSprite);
		super(shape,200,200);
		
		addAnimation("idle", [0], 0, false);
		play("idle");
	}
	
}

}

