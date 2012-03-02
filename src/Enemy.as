package 
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import flash.display.*;


public class Enemy extends AnimSprite
{
	private var score:Number;
	private var def:int;
	
	public function Enemy(x:Number, y:Number)
	{
		this.x = x;
		this.y = y;
		score = 100;
		def = 1;
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
	
	public function death():Number
	{
		this.parent.removeChild(this);
		return score;
	}
	
	public function encount(atk:Number):Boolean
	{
		return atk >= def;
	}
	
}

}

