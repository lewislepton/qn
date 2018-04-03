import kha.graphics2.Graphics;
import kha.Color;
import kha.Image;
import kha.Assets;

import qn.World;
import qn.Body.RectImage;

class RectPlayer extends RectImage {
	public function new(){
		super(World.space, Assets.images.rect);
	}

	public function update(){
		
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
	}
}