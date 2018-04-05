package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;

import qn.World;
import qn.Body.RectShape;

import Circle;
import Rect;

class Project {
	var arCircle:Array<Circle>;
	var arRect:Array<Rect>;

	var floor:RectShape;
	var leftWall:RectShape;
	var rightWall:RectShape;

	public function new(){
		World.setup(0, 300);

		floor = new RectShape(World.space, Main.WIDTH, 32);
		floor.position(Main.WIDTH / 2, Main.HEIGHT - 16);
		floor.allowMovement(false);
		floor.allowRotation(false);

		leftWall = new RectShape(World.space, 8, Main.HEIGHT);
		leftWall.position(4, Main.HEIGHT / 2);
		leftWall.allowMovement(false);
		leftWall.allowRotation(false);

		rightWall = new RectShape(World.space, 8, Main.HEIGHT);
		rightWall.position(Main.WIDTH - 4, Main.HEIGHT / 2);
		rightWall.allowMovement(false);
		rightWall.allowRotation(false);

		arCircle = [];
		arRect = [];

		Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function update():Void {
		World.update(1 / 60);
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();

		floor.render(graphics);
		leftWall.render(graphics);
		rightWall.render(graphics);

		for (circles in arCircle){
			circles.render(graphics);
		}

		for (rects in arRect){
			rects.render(graphics);
		}

		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		if (button == 0){
			createCircle(x, y);
		} else if (button == 1){
			createRect(x, y);
		}
	}

	public function createCircle(?x:Float = 0, ?y:Float = 0){
		for (circles in arCircle){
			if (!circles.active){
				circles.activate(x, y);
				return;
			}
		}
		arCircle.push(new Circle(x, y));
	}

	public function createRect(?x:Float = 0, ?y:Float = 0){
		for (rects in arRect){
			if (!rects.active){
				rects.activate(x, y);
				return;
			}
		}
		arRect.push(new Rect(x, y));
	}
}
