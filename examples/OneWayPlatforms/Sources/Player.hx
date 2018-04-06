import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;

import qn.World;
import qn.Body.CircleShape;

class Player extends CircleShape {
	public var up:Bool;
	public var down:Bool;
	public var left:Bool;
	public var right:Bool;

	public var speed = 3;

	public function new(){
		super(World.space, 32);
		material(3.0, 0);
		fill = true;
	}

	public function update(){
		if (left){
			this.impulse(-speed, 0);
		} else if (right){
			this.impulse(speed, 0);
		} else {
			this.impulse(0, 0);
		}
		
		if (up){
			this.impulse(0, -30);
		}
	}

	override public function render(graphics:Graphics){
		graphics.color = Color.Yellow;
		super.render(graphics);
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Up: up = true;
			case KeyCode.Left: left = true;
			case KeyCode.Right: right = true;
		default: return;
		}
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Up: up = false;
			case KeyCode.Left: left = false;
			case KeyCode.Right: right = false;
		default: return;
		}
	}
}