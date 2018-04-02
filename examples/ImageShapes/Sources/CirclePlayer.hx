import kha.graphics2.Graphics;
import kha.Color;
import kha.Image;
import kha.Assets;

import nape.space.Space;
import qn.shape.Circle.CImage;

class CirclePlayer extends CImage {
	public function new(space:Space){
		super(space, Assets.images.circle);
	}

	public function update(){
		
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
	}
}