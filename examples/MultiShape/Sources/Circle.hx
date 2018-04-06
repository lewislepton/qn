import kha.graphics2.Graphics;

import qn.World;
import qn.Body.CircleShape;

class Circle extends CircleShape {
	public var x:Float;
	public var y:Float;
	public var active:Bool;
	public function new(x:Float, y:Float){
		this.x = x;
		this.y = y;
		super(World.space, Math.random() * 128);

		var choice:Int = Math.floor(Math.random() * 2);
		switch (choice){
			case 0: fill = true;
			case 1: fill = false;
		default: return;
		}

		position(x, y);
		activate(x, y);
	}

	override public function render(graphics:Graphics){
		if (!active) return;
		super.render(graphics);
	}

	public function activate(x:Float, y:Float){
		active = true;
	}
}