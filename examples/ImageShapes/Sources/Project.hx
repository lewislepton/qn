package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;

import qn.World;
import CirclePlayer;
import RectPlayer;

/*
MATERIAL CHEAT SHEET
wood
0.4,0.2,0.38,0.7,0.005
steel
0.2,0.57,0.74,7.8,0.001
ice
0.3,0.03,0.1,0.9,0.0001
rubber
0.8,1.0,1.4,1.5,0.01
glass
0.4,0.4,0.94,2.6,0.002
sand
-1.0,0.45,0.6,1.6,16.0
*/

class Project {
	var circlePlayer:CirclePlayer;
	var rectPlayer:RectPlayer;
	
	public function new(){
		World.setup(0, 300);
		// World.linearDrag(30);
		// World.angularDrag(30);

		rectPlayer = new RectPlayer();
		rectPlayer.position(Main.WIDTH / 2, Main.HEIGHT / 2);
		rectPlayer.material(1.0, 0.7);
		rectPlayer.allowMovement(false);
		rectPlayer.allowRotation(false);

		circlePlayer = new CirclePlayer();
		circlePlayer.position(Main.WIDTH / 2, 0);
		circlePlayer.material(1.0, 0.3);

		Mouse.get().notify(null, null, onMouseMove, null);
	}

	public function update():Void {
		World.update(1 / 60);
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		circlePlayer.render(graphics);
		rectPlayer.render(graphics);
		graphics.end();
	}

	public function onMouseMove(x:Int, y:Int, mx:Int, my:Int):Void {
		// circlePlayer.position(x, y);
	}
}
