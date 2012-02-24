package
{
	public class Anim
	{
		public var frames:Array;
		public var index:int;
		public var delay:Number;
		public var name:String;
		public var looped:Boolean;
 
		public function Anim(name:String, frames:Array, index:int, delay:Number, looped:Boolean):void
		{
			this.name = name;
			this.frames = frames;
			this.index = index;
			this.delay = delay;
			this.looped = looped;
			super();5
		}
	}
}