package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.input.Mouse;

import qn.World;

import Circle;
import FluidBody;

class Project {
	var arCircle:Array<Circle>;

	var fluid:FluidBody;

	var floor:Platform;
	var top:Platform;
	var wallLeft:Platform;
	var wallRight:Platform;

	public function new(){
		World.setup(0, 600);

		arCircle = [];

		fluid = new FluidBody();
		fluid.position(Main.WIDTH / 2, Main.HEIGHT - 128);

		floor = new Platform(Main.WIDTH, 32);
		floor.position(Main.WIDTH / 2, Main.HEIGHT - 16);

		top = new Platform(Main.WIDTH, 32);
		top.position(Main.WIDTH / 2, 16);

		wallLeft = new Platform(32, Main.HEIGHT);
		wallLeft.position(8, Main.HEIGHT / 2);
		
		wallRight = new Platform(32, Main.HEIGHT);
		wallRight.position(Main.WIDTH - 8, Main.HEIGHT / 2);

		Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function update():Void {
		World.update(1 / 60);
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin(true, Color.fromFloats(0.67, 0.82, 0.42, 1.00));

		fluid.render(graphics);

		for (circles in arCircle){
			circles.render(graphics);
		}

		floor.render(graphics);
		top.render(graphics);
		wallLeft.render(graphics);
		wallRight.render(graphics);
		
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		if (button == 0){
			create(x, y);
		}
	}

	public function create(?x:Float = 0, ?y:Float = 0){
		for (circles in arCircle){
			if (!circles.active){
				circles.activate(x, y);
				return;
			}
		}
		arCircle.push(new Circle(x, y));
	}
}
