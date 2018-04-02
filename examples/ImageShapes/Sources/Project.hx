package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;

import nape.space.Space;

import CirclePlayer;
import RectPlayer;

class Project {
	var space:Space;
	var circlePlayer:CirclePlayer;
	var rectPlayer:RectPlayer;
	
	public function new(){
		space = new Space();

		circlePlayer = new CirclePlayer(space);
		circlePlayer.body.position.x = 256;
		circlePlayer.body.position.y = 256;

		rectPlayer = new RectPlayer(space);
		rectPlayer.body.position.x = Main.WIDTH / 2;
		rectPlayer.body.position.y = Main.HEIGHT / 2;

		rectPlayer.body.allowMovement = false;
		rectPlayer.body.allowRotation = true;

		Mouse.get().notify(null, null, onMouseMove, null);
	}

	public function update():Void {
		space.step(1 / 60);
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		circlePlayer.render(graphics);
		rectPlayer.render(graphics);
		graphics.end();
	}

	public function onMouseMove(x:Int, y:Int, mx:Int, my:Int):Void {
		circlePlayer.body.position.x = x;
		circlePlayer.body.position.y = y;
	}
}
