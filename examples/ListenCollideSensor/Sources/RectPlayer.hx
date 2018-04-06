import kha.graphics2.Graphics;
import kha.Color;
import kha.Assets;

import qn.World;
import qn.Body.RectImage;

class RectPlayer extends RectImage {
	public function new(){
		super(World.space, Assets.images.rect);
	}

	override public function render(graphics:Graphics){
		graphics.color = Color.White;
		super.render(graphics);
	}
}