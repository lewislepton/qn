import kha.graphics2.Graphics;
import kha.Color;

import qn.World;
import qn.Body.RectShape;

class FluidBody extends RectShape {
	public function new(){
		super(World.space, Main.WIDTH, 256);

		allowMovement(false);
		allowRotation(false);

		fill = true;

		fluidEnabled(true);
		fluidMask(2);

		density(2);
		viscosity(3);
	}

	override public function render(graphics:Graphics){
		graphics.color = Color.Blue;
		super.render(graphics);
	}
}