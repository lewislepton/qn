package qn;

/*
@uthor lewis lepton 2018
https://lewislepton.com
*/

import nape.phys.Body;
import nape.callbacks.InteractionListener;
import nape.callbacks.InteractionType;
import nape.callbacks.InteractionCallback;
import nape.callbacks.CbEvent;
import nape.callbacks.CbType;

import qn.World;

class Listen {
	public static var collision:CbType = new CbType();
	public static var listen:InteractionListener;
	public static var hasCollided:Bool = false;
	public static var hasSensored:Bool = false;

	// public static inline public function setup(){
	// 	listen = new InteractionListener()
	// }

	public static function setupCollision(){
		listen = new InteractionListener(CbEvent.BEGIN, InteractionType.COLLISION, collision, collision, contact);
		World.space.listeners.add(listen);
	}

	public static function setupFluid(){
		listen = new InteractionListener(CbEvent.BEGIN, InteractionType.FLUID, collision, collision, contact);
		World.space.listeners.add(listen);
	}

	public static function setupSensor(){
		listen = new InteractionListener(CbEvent.BEGIN, InteractionType.SENSOR, collision, collision, sensor);
		World.space.listeners.add(listen);
	}

	public static function setupAny(){
		listen = new InteractionListener(CbEvent.BEGIN, InteractionType.ANY, collision, collision, sensor);
		World.space.listeners.add(listen);
	}

	public static function contact(collide:InteractionCallback){
		// if (hasCollided){
		// 	hasCollided = true;
		// } else {
		// 	hasCollided = false;
		// }
		hasCollided = true;
		// return false;
	}

	public static function sensor(collide:InteractionCallback){
		// if (hasSensored){
			hasSensored = true;
		// } else {
		// 	hasSensored = false;
		// }
		// return false;
	}
}