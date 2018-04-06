package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Keyboard;
import kha.input.KeyCode;

import qn.World;
import qn.OneWay;

import Platform;
import Player;

class Project {
	var player:Player;

	var arPlatform:Array<Platform>;

	var floor:Platform;
	var top:Platform;
	var wallLeft:Platform;
	var wallRight:Platform;

	public function new(){
		World.setup(0, 600);
		OneWay.setup();

		arPlatform = [];
		for (i in 0 ... 12){
			var platforms:Platform = new Platform(128, 32);
			platforms.position(Math.random() * Main.WIDTH, Math.random() * Main.HEIGHT);
			platforms.addType(OneWay.type);
			arPlatform.push(platforms);
		}

		floor = new Platform(Main.WIDTH, 32);
		floor.position(Main.WIDTH / 2, Main.HEIGHT - 16);

		top = new Platform(Main.WIDTH, 32);
		top.position(Main.WIDTH / 2, 16);

		wallLeft = new Platform(32, Main.HEIGHT);
		wallLeft.position(8, Main.HEIGHT / 2);
		
		wallRight = new Platform(32, Main.HEIGHT);
		wallRight.position(Main.WIDTH - 8, Main.HEIGHT / 2);

		player = new Player();
		player.position(Main.WIDTH / 2, 128);

		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		World.update(1 / 60);
		player.update();
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin(true, Color.fromFloats(0.67, 0.82, 0.42, 1.00));

		for (platforms in arPlatform){
			platforms.render(graphics);
		}
		
		player.render(graphics);

		floor.render(graphics);
		top.render(graphics);
		wallLeft.render(graphics);
		wallRight.render(graphics);

		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		player.onKeyDown(keyCode);
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		player.onKeyUp(keyCode);
	}
}
