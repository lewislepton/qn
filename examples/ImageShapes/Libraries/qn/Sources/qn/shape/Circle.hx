package qn.shape;

/*
@uthor lewis lepton 2018
https://lewislepton.com
*/

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.Image;

import nape.space.Space;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Circle;
import nape.geom.Vec2;

class CShape {
	public var x:Float;
	public var y:Float;
	public var radius:Float = 32;

	public var body:Body;
	public var shape:Circle;

	public function new(space:Space, ?radius:Float = 32){
		// this.x = x;
		// this.y = y;
		this.radius = radius;
		body = new Body();
		// body.allowRotation = false;
		// x = body.position.x;
		// y = body.position.y;
		shape = new Circle(radius);
		shape.body = body;
		body.shapes.add(shape);
		body.space = space;
	}

	// public function update(){
	// 	shape.radius = radius / 2;
	// }

	public function render(graphics:Graphics){
		var pos:Vec2;
		pos = body.position;
		graphics.pushRotation(body.rotation, pos.x, pos.y);
		graphics.drawCircle(body.position.x, body.position.y, radius);
		graphics.popTransformation();
	}
}

class CImage {
	public var body:Body;
  public var shape:Circle;

  public var x:Float;
  public var y:Float;

  public var image:Image;

	public function new(space:Space, image:Image){
		this.image = image;

		body = new Body();
		shape = new Circle(image.width / 2);
		shape.body = body;
		body.shapes.add(shape);
		body.space = space;
	}

	public function render(graphics:Graphics){
		var pos:Vec2;
		pos = body.position;
		graphics.pushRotation(body.rotation, pos.x, pos.y);
		graphics.drawScaledImage(image, body.position.x - image.width / 2, body.position.y - image.height / 2, image.width, image.height);
		graphics.popTransformation();
	}
}