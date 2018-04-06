import kha.graphics2.Graphics;
import kha.Color;

import qn.World;
import qn.Body.CircleShape;

class Circle extends CircleShape {
	public var active:Bool;

	public function new(x:Float, y:Float){
		super(World.space, Math.random() * 128);
		fill = true;
		position(x, y);
		fluidGroup(2);
		activate(x, y);
	}

	override public function render(graphics:Graphics){
		if (!active) return;
		graphics.color = Color.Pink;
		super.render(graphics);
	}

	public function activate(x:Float, y:Float){
		active = true;
	}
}