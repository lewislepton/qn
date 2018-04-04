package qn;

/*
@uthor lewis lepton 2018
https://lewislepton.com

the bodies X/Y starts in the center
*/

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Image;

import nape.space.Space;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Circle;
import nape.shape.Polygon;
import nape.geom.Vec2;
import nape.phys.Material;
import nape.callbacks.CbType;

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

///CIRCLE
class CircleShape {
	public var radius:Float = 32;

	public var body:Body;
	public var shape:Circle;

	public function new(space:Space, ?radius:Float = 32, ?sensorEnabled:Bool = false){
		this.radius = radius;

		body = new Body();
		shape = new Circle(radius / 2);
		shape.body = body;
		body.shapes.add(shape);
		body.space = space;
	}

	public function render(graphics:Graphics){
		var pos:Vec2;
		pos = body.position;
		graphics.pushRotation(body.rotation, pos.x, pos.y);
		graphics.drawCircle(body.position.x, body.position.y, radius / 2);
		graphics.popTransformation();
	}

	public function material(elastic:Float = 1, dynamicFriction:Float = 0.2, ?staticFriction:Float = 0.4, ?density:Float = 1, rotateFriction:Float = 0.001):Void {
		if (body == null) return;
		body.setShapeMaterials(new Material(elastic, dynamicFriction, staticFriction, density, rotateFriction));
	}

	public function position(x:Float, y:Float):Vec2 {
		return body.position.set(new Vec2(x, y));
	}

	public function impulse(x:Float, y:Float):Body {
		return body.applyImpulse(new Vec2(x, y));
	}

	public function impulseRotate(value:Float):Body {
		return body.applyAngularImpulse(value);
	}

	public function allowMovement(value:Bool = false):Bool {
		return body.allowMovement = value;
	}

	public function allowRotation(value:Bool = false):Bool {
		return body.allowRotation = value;
	}

	public function sensorEnabled(value:Bool = false):Bool {
		return shape.sensorEnabled = value;
	}

	public function addType(cbType:CbType):Bool {
		return body.cbTypes.add(cbType);
	}
}

class CircleImage {
	var body:Body;
  var shape:Circle;

  public var image:Image;

	public function new(space:Space, image:Image){
		this.image = image;

		body = new Body();
		shape = new Circle(image.width / 2); ///could do better scaling the circle. but so far for circles, its fine just now
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

	public function material(elastic:Float = 1, dynamicFriction:Float = 0.2, ?staticFriction:Float = 0.4, ?density:Float = 1, rotateFriction:Float = 0.001):Void {
		if (body == null) return;
		body.setShapeMaterials(new Material(elastic, dynamicFriction, staticFriction, density, rotateFriction));
	}

	public function position(x:Float, y:Float):Vec2 {
		return body.position.set(new Vec2(x, y));
	}

	public function impulse(x:Float, y:Float):Body {
		return body.applyImpulse(new Vec2(x, y));
	}

	public function impulseRotate(value:Float):Body {
		return body.applyAngularImpulse(value);
	}

	public function allowMovement(value:Bool = false):Bool {
		return body.allowMovement = value;
	}

	public function allowRotation(value:Bool = false):Bool {
		return body.allowRotation = value;
	}

	public function sensorEnabled(value:Bool = false):Bool {
		return shape.sensorEnabled = value;
	}

	public function addType(cbType:CbType):Bool {
		return body.cbTypes.add(cbType);
	}
}
///

///RECTANGLE
class RectShape {
	public var width:Float;
	public var height:Float;

	public var body:Body;
	public var shape:Polygon;

	public function new(space:Space, ?width:Float = 64, ?height:Float = 64, ?sensorEnabled:Bool = false){
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

	public function material(elastic:Float = 1, dynamicFriction:Float = 0.2, ?staticFriction:Float = 0.4, ?density:Float = 1, rotateFriction:Float = 0.001):Void {
		if (body == null) return;
		body.setShapeMaterials(new Material(elastic, dynamicFriction, staticFriction, density, rotateFriction));
	}

	public function position(x:Float, y:Float):Vec2 {
		return body.position.set(new Vec2(x, y));
	}

	public function impulse(x:Float, y:Float):Body {
		return body.applyImpulse(new Vec2(x, y));
	}

	public function impulseRotate(value:Float):Body {
		return body.applyAngularImpulse(value);
	}

	public function allowMovement(value:Bool = false):Bool {
		return body.allowMovement = value;
	}

	public function allowRotation(value:Bool = false):Bool {
		return body.allowRotation = value;
	}

	public function sensorEnabled(value:Bool = false):Bool {
		return shape.sensorEnabled = value;
	}

	public function addType(cbType:CbType):Bool {
		return body.cbTypes.add(cbType);
	}
}

class RectImage {
	public var body:Body;
  public var shape:Polygon;

  public var image:Image;

	public function new(space:Space, image:Image, ?sensorEnabled:Bool = false){
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

	public function material(elastic:Float = 1, dynamicFriction:Float = 0.2, ?staticFriction:Float = 0.4, ?density:Float = 1, rotateFriction:Float = 0.001):Void {
		if (body == null) return;
		body.setShapeMaterials(new Material(elastic, dynamicFriction, staticFriction, density, rotateFriction));
	}

	public function position(x:Float, y:Float):Vec2 {
		return body.position.set(new Vec2(x, y));
	}

	public function impulse(x:Float, y:Float):Body {
		return body.applyImpulse(new Vec2(x, y));
	}

	public function impulseRotate(value:Float):Body {
		return body.applyAngularImpulse(value);
	}

	public function allowMovement(value:Bool = false):Bool {
		return body.allowMovement = value;
	}

	public function allowRotation(value:Bool = false):Bool {
		return body.allowRotation = value;
	}

	public function sensorEnabled(value:Bool = false):Bool {
		return shape.sensorEnabled = value;
	}

	public function addType(cbType:CbType):Bool {
		return body.cbTypes.add(cbType);
	}
}
///