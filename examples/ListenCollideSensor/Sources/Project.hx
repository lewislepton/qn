package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;
import kha.Font;

import qn.World;
import qn.Listen;

import RectPlayer;
import CirclePlayer;

class Project {
	var rectListener:RectPlayer;
	var rectPlayer:RectPlayer;
	var circlePlayer:CirclePlayer;

	var font:Font;
	var collideScore:Int;
	var sensorScore:Int;

	public function new(){
		World.setup(0, 300);
		
		Listen.setupCollision();
		Listen.setupSensor();

		rectListener = new RectPlayer();
		rectListener.body.position.x = Main.WIDTH / 2;
		rectListener.body.position.y = Main.HEIGHT / 2;
		rectListener.body.cbTypes.add(Listen.collision);

		rectListener.allowRotation(true);
		rectListener.allowMovement(false);
		rectListener.sensorEnabled(true);

		circlePlayer = new CirclePlayer();
		circlePlayer.body.position.x = Main.WIDTH / 2;
		circlePlayer.body.position.y = 64;
		circlePlayer.material(3.0, 0.0);
		circlePlayer.body.cbTypes.add(Listen.collision);
		circlePlayer.sensorEnabled(false);

		rectPlayer = new RectPlayer();
		rectPlayer.body.position.x = Main.WIDTH / 2;
		rectPlayer.body.position.y = Main.HEIGHT - 64;
		rectPlayer.body.cbTypes.add(Listen.collision);
		circlePlayer.material(3.0, 0.0);
		rectPlayer.allowMovement(false);
		rectPlayer.allowRotation(false);
		rectPlayer.sensorEnabled(false);

		font = Assets.fonts.Exo_Thin;

		Mouse.get().notify(onMouseDown, onMouseUp, null, null);
	}

	public function update():Void {
		World.update(1 / 60);
		rectListener.impulseRotate(100);

		if (Listen.hasCollided){
			collideScore += 1;
			Listen.hasCollided = false;
		}

		if (Listen.hasSensored){
			sensorScore += 1;
			Listen.hasSensored = false;
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		rectListener.render(graphics);
		rectPlayer.render(graphics);
		circlePlayer.render(graphics);

		graphics.font = font;
		graphics.fontSize = 64;
		graphics.drawString('' + collideScore, 32, 32);
		graphics.drawString('' + sensorScore, 32, 128);
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		rectListener.sensorEnabled(false);
	}

	public function onMouseUp(button:Int, x:Int, y:Int):Void {
		rectListener.sensorEnabled(true);
	}
}
