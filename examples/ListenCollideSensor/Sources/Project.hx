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
	var sensorListenMiddle:Listen;
	var collideListenBottom:Listen;
	var collideListenTop:Listen;

	var rectListener:RectPlayer;
	var rectTop:RectPlayer;
	var rectBottom:RectPlayer;

	var circlePlayer:CirclePlayer;

	var font:Font;
	var collideScoreBottom:Int = 0;
	var collideScoreTop:Int = 0;
	var sensorScore:Int = 0;

	public function new(){
		World.setup(0, 300);
		sensorListenMiddle = new Listen(2);
		collideListenBottom = new Listen(1);
		collideListenTop = new Listen(1);

		circlePlayer = new CirclePlayer();
		circlePlayer.position(Main.WIDTH / 2, 64);
		circlePlayer.material(3.0, 0.0);
		circlePlayer.sensorEnabled(false);
		circlePlayer.addType(sensorListenMiddle.collision);
		circlePlayer.addType(collideListenBottom.collision);
		circlePlayer.addType(collideListenTop.collision);

		rectTop = new RectPlayer();
		rectTop.position(Main.WIDTH / 2, 128);
		rectTop.addType(collideListenTop.collision);
		rectTop.material(3.0, 0.0);
		rectTop.allowMovement(false);
		rectTop.allowRotation(false);
		rectTop.sensorEnabled(false);

		rectListener = new RectPlayer();
		rectListener.position(Main.WIDTH / 2, Main.HEIGHT / 2);
		rectListener.addType(sensorListenMiddle.collision);
		rectListener.allowRotation(true);
		rectListener.allowMovement(false);
		rectListener.sensorEnabled(true);

		rectBottom = new RectPlayer();
		rectBottom.position(Main.WIDTH / 2, Main.HEIGHT - 64);
		rectBottom.addType(collideListenBottom.collision);
		rectBottom.material(3.0, 0.0);
		rectBottom.allowMovement(false);
		rectBottom.allowRotation(false);
		rectBottom.sensorEnabled(false);

		font = Assets.fonts.Exo_Thin;

		Mouse.get().notify(onMouseDown, onMouseUp, null, null);
	}

	public function update():Void {
		World.update(1 / 60);

		if (collideListenTop.hasCollided){
			trace('COLLIDE TOP');
			collideScoreTop += 1;
			collideListenTop.hasCollided = false;
		}

		if (sensorListenMiddle.hasSensored){
			trace('SENSORED CENTER');
			sensorScore += 1;
			sensorListenMiddle.hasSensored = false;
		}

		if (collideListenBottom.hasCollided){
			trace('COLLIDE BOTTOM');
			collideScoreBottom += 1;
			collideListenBottom.hasCollided = false;
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin(true, Color.fromFloats(0.67, 0.82, 0.42, 1.00));

		rectTop.render(graphics);
		rectListener.render(graphics);
		rectBottom.render(graphics);

		circlePlayer.render(graphics);

		graphics.font = font;
		graphics.fontSize = 64;
		graphics.color = Color.Black;
		graphics.drawString('collision: ' + collideScoreTop, 128, 64);
		graphics.drawString('sensor: ' + sensorScore, 128, Main.HEIGHT / 2);
		graphics.drawString('collision: ' + collideScoreBottom, 128, Main.HEIGHT - 96);

		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		if (button == 0){
			rectTop.sensorEnabled(true);
		} else if (button == 1){
			rectListener.impulseRotate(200);
		}
	}

	public function onMouseUp(button:Int, x:Int, y:Int):Void {
		if (button == 0){
			rectTop.sensorEnabled(false);
		} else if (button == 1){
			rectListener.impulseRotate(0);
		}
	}
}