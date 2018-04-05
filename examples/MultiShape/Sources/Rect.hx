import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import qn.World;
import qn.Body.RectShape;

class Rect extends RectShape {
	public var x:Float;
	public var y:Float;
	public var active:Bool;

	public function new(x:Float, y:Float){
		this.x = x;
		this.y = y;

		super(World.space, Math.random() * 128, Math.random() * 128);

		var choice:Int = Math.floor(Math.random() * 2);
		switch (choice){
			case 0: fill = true;
			case 1: fill = false;
		default: return;
		}
		
		position(x, y);
		activate(x, y);
	}

	public function update(){
		
	}

	override public function render(graphics:Graphics){
		if (!active) return;
		super.render(graphics);
	}

	public function activate(x:Float, y:Float){
		active = true;
	}
}