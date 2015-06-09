package com.atomicsoftware.aztecwords;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureAtlas.AtlasRegion;

public class SmallButton extends Button {

    private AtlasRegion alternative;
    private AtlasRegion current;

    public SmallButton(AtlasRegion region, AtlasRegion alternative, int x, int y) {
        super(region, x, y);
        current = region;
        this.alternative = alternative;
        setBounds(x, y, 109, 109);
    }

    public void press() {
        if(current == region) {
            current = alternative;
        } else {
            current = region;
        }
    }

    @Override
    public void draw(Batch batch, float parentAlpha) {
        if(isHovered) {
            batch.setColor(1.0f, 1.0f, 1.0f, 1.0f);
        } else {
            batch.setColor(1.0f - DARKEN_FACTOR, 1.0f - DARKEN_FACTOR, 1.0f - DARKEN_FACTOR, 1.0f);
        }

        batch.draw(current, getX(), getY());

        batch.setColor(1.0f, 1.0f, 1.0f, 1.0f);
    }

}
