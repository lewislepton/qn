import kha.graphics2.Graphics;
import kha.Color;

import qn.World;
import qn.Body.RectShape;

class Platform extends RectShape {
	public function new(width:Float, height:Float){
		super(World.space, width, height);
		fill = true;
		allowMovement(false);
		allowRotation(false);
	}

	public function update(){
		
	}

	override public function render(graphics:Graphics){
		graphics.color = Color.Orange;
		super.render(graphics);
	}
}