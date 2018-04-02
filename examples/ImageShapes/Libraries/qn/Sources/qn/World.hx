package qn;

/*
@uthor lewis lepton 2018
https://lewislepton.com
*/

import nape.space.Space;
import nape.geom.Vec2;

class World {
	var space:Space;
	public var gravityX:Float;
	public var gravityY:Float;

	public function new(gravityX:Float, gravityY:Float){
		space = new Space(new Vec2(gravityX, gravityY));
	}
	public function update(value:Float):Void {
		space.step(value);
	}
}