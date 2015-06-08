package com.atomicsoftware.aztecwords;

import com.badlogic.gdx.Game;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;

public class AztecWords extends Game {
	public SpriteBatch batch;
	
	@Override
	public void create () {
		batch = new SpriteBatch();

        Assets.load();

		setScreen(new MenuScreen(this));
	}

	@Override
	public void render () {
		super.render();
	}
}
