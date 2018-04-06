package qn;

/*
@uthor lewis lepton 2018
https://lewislepton.com
*/

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Image;
import polyPainter.PolyPainter;
import nape.space.Space;
import nape.phys.Body;
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
///TRIANGLE
class TriangleShape {
	public var body: Body;
	public static var poly
	public var shape: Polygon;
	public var fill: Bool;
	public var ax: Float;
	public var ay: Float;
	public var bx: Float;
	public var by: Float;
	public var cx: Float;
	public var cy: Float;
	public var weak: Bool = false;
	public function new(space: space, ax: Float, ay: Float, bx: Float, by: Float, cx: Float, cy: Float, ?sensorEnabled: Bool = false ){
		this.ax = ax;
		this.ay = ay;
		this.bx = bx;
		this.by = by;
		this.cx = cx;
		this.cy = cy;
		body = new Body();
		shape = new Polygon( [ Vec2.get(ax,ay,weak), Vec2.get(bx,by,weak), Vec2.get(cx,cy,weak) ] );
		body.shapes.add( shape );
		body.space = space;
	}
	public function render(graphics:Graphics){
		var pos:Vec2;
		pos = body.position;
		var verts = shape.worldVerts();
		va = verts.at(0);
		vb = verts.at(1);
		vc = verts.ad(2);
		if (fill){
			graphics.fillTriangle( va.x, va.y, vb.x, vb.y, vc.x, vc.y );
		} else {
			graphics.drawTriangle( va.x, va.y, vb.x, vb.y, vc.x vc.y );
		}
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
class TriangleImage {
  	var body:Body;
  	var shape:Polygon;
	public static var poly: PolyPainter = new PolyPainter();
	public var x: Float;
	public var y: Float;
	public var bx: Float;
	public var by: Float;
	public var cx: Float;
	public var cy: Float;
	public var au: Float;
	public var av: Float;
	public var bu: Float;
	public var bv: Float;
	public var cu: Float;
	public var cv: Float;
	public var weak: Bool = false;
  	public var image:Image;
	public var alpha: Float = 1.;
	public function new(space:Space, ax: Float, ay: Float, bx: Float, by: Float, cx: Float, cy: Float
					 au: Float, av: Float, bu: Float, bv: Float, cu: Float, cv: Float, image:Image){
		this.image = image;
		this.ax = ax;
		this.ay = ay;
		this.bx = bx;
		this.by = by;
		this.cx = cx;
		this.cy = cy;
		this.au = au;
		this.ay = ay;
		this.bu = bu;
		this.bv = bv;
		this.cu = cu;
		this.cv = cv;
		body = new Body();
		shape = new Polygon([ Vec2.get(ax,ay,weak), Vec2.get(bx,by,weak), Vec2.get(cx,cy,weak) ] ); 
		shape.body = body;
		body.shapes.add(shape);
		body.space = space;
	}
        // do not call within the main g2 draw loop do before after perhaps in update!!
        // requires framebuffer not g2
	public function render(framebuffer: Framebuffer ): Void {
		var pos:Vec2;
		pos = body.position;
		var verts = shape.worldVerts();
		va = verts.at(0);
		vb = verts.at(1);
		vc = verts.ad(2);
		poly.framebuffer = framebuffer;    
                poly.begin( true );
		poly.drawImageTriangle( va.x, va.y, vb.x, vb.y, vc.x, vc.y 
                                    ,  au, av, bu, bv, cu, cv
                                    , image, alpha );
       		poly.end();
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
///CIRCLE
class CircleShape {
	public var radius:Float = 32;

	public var body:Body;
	public var shape:Circle;
	public var fill:Bool;

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
		if (fill){
			graphics.fillCircle(body.position.x, body.position.y, radius / 2);
		} else {
			graphics.drawCircle(body.position.x, body.position.y, radius / 2);
		}
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

	public var fill:Bool;

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
		if (fill){
			graphics.fillRect(body.position.x - width / 2, body.position.y - height / 2, width, height);
		} else {
			graphics.drawRect(body.position.x - width / 2, body.position.y - height / 2, width, height);
		}
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
