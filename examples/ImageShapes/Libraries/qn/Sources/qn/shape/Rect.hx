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
import nape.shape.Polygon;
import nape.geom.Vec2;

class RShape {
	public var x:Float;
	public var y:Float;

	public var width:Float;
	public var height:Float;

	public var body:Body;
	public var shape:Polygon;

	public function new(space:Space, ?width:Float = 64, ?height:Float = 64){
		this.width = width;
		this.height = height;

		body = new Body();
		shape = new Polygon(Polygon.box(width, height));
		shape.body = body;
		body.shapes.add(shape);
		body.space = space;
	}

	public function render(graphics:Graphics){
		var pos:Vec2;
		pos = body.position;
		graphics.pushRotation(body.rotation, pos.x, pos.y);
		graphics.drawRect(body.position.x - width / 2, body.position.y - height / 2, width, height);
		graphics.popTransformation();
	}
}

class RImage {
	public var body:Body;
  public var shape:Polygon;

  public var x:Float;
  public var y:Float;

  public var image:Image;

	public function new(space:Space, image:Image){
		this.image = image;

		body = new Body();
		shape = new Polygon(Polygon.box(image.width, image.height));
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