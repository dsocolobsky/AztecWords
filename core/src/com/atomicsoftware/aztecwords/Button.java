package com.atomicsoftware.aztecwords;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureAtlas.*;
import com.badlogic.gdx.scenes.scene2d.Actor;

public class Button extends Actor {

    protected AtlasRegion region;
    protected boolean isHovered = false;
    protected final float DARKEN_FACTOR = 0.15f;

    public Button(AtlasRegion region, int x, int y) {
        super();

        this.region = region;
        setBounds(x, y, 333, 115);
    }

    @Override
    public void draw(Batch batch, float parentAlpha) {
        if(isHovered) {
            batch.setColor(1.0f, 1.0f, 1.0f, 1.0f);
        } else {
            batch.setColor(1.0f - DARKEN_FACTOR, 1.0f - DARKEN_FACTOR, 1.0f - DARKEN_FACTOR, 1.0f);
        }

        batch.draw(region, getX(), getY());

        batch.setColor(1.0f, 1.0f, 1.0f, 1.0f);
    }

    public void hover() {
        isHovered = true;
    }

    public void dehover() {
        isHovered = false;
    }
}
