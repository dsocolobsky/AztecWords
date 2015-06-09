package com.atomicsoftware.aztecwords;

import com.badlogic.gdx.Game;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;

public class AztecWords extends Game {
	public SpriteBatch batch;

	private MenuScreen menuScreen = null;
	private GameScreen gameScreen = null;

    public boolean playsSound = true;
    public boolean fullscreen = false;
	
	@Override
	public void create () {
		batch = new SpriteBatch();

        Assets.load();

		startMenu();
	}

	@Override
	public void render () {
		super.render();
	}

	public void startMenu() {
		if(menuScreen == null) {
			menuScreen = new MenuScreen(this);
		}

		setScreen(menuScreen);
	}

	public void startGame() {
		if(gameScreen == null) {
			gameScreen = new GameScreen(this);
		}

		setScreen(gameScreen);
	}

}
