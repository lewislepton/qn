import kha.graphics2.Graphics;
import kha.Color;
import kha.Image;
import kha.Assets;

import nape.space.Space;

import qn.shape.Rect.RImage;

class RectPlayer extends RImage {
	public function new(space:Space){
		super(space, Assets.images.rect);
	}

	public function update(){
		
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
	}
}