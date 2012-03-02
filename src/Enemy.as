package 
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import flash.display.*;
	import flash.media.Sound;


public class Enemy extends AnimSprite
{
	[Embed(source = "../resource/sen_ka_katana_kosure01.mp3", mimeType = "audio/mpeg")]
	private var deathSE:Class;
	
	private var score:Number;
	private var def:int;
	private var dSE:Sound;
	
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
		
		dSE = new deathSE;
		
		addAnimation("idle", [0], 0, false);
		play("idle");
	}
	
	public function death():Number
	{
		dSE.play();
		this.parent.removeChild(this);
		return score;
	}
	
	public function encount(atk:Number):Boolean
	{
		return atk >= def;
	}
	
}

}

