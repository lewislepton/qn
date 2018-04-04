package qn;

/*
@uthor lewis lepton 2018
https://lewislepton.com
*/

import nape.space.Space;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.phys.Material;
import nape.shape.Polygon;

class World {
	public static var space:Space;
	public static var gravityX:Float;
	public static var gravityY:Float;

	public static var velocityIterations:Int = 10;
	public static var positionIterations:Int = 10;

	public static function setup(gravityX:Float, gravityY:Float){
		space = new Space(new Vec2(gravityX, gravityY));
	}

	public static function update(delta:Float){
		if (space != null && delta > 0){
			space.step(delta, velocityIterations, positionIterations);
		}
	}

	public static function linearDrag(value:Float):Float {
		return space.worldLinearDrag = value;
	}

	public static function angularDrag(value:Float):Float {
		return space.worldAngularDrag = value;
	}
}