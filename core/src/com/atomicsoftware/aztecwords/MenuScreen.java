package com.atomicsoftware.aztecwords;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.ScreenAdapter;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.utils.viewport.ScreenViewport;

public class MenuScreen extends ScreenAdapter {
    private final AztecWords game;

    private Texture background;
    private TextureAtlas.AtlasRegion title;

    private Stage stage;
    private Button playButton;
    private Button exitButton;
    private SmallButton soundButton;
    private SmallButton windowButton;

    public MenuScreen(final AztecWords game) {
        this.game = game;
        stage = new Stage(new ScreenViewport(), game.batch);
        Gdx.input.setInputProcessor(stage);

        background = Assets.menutexture;
        title = Assets.titulo;

        playButton = new Button(Assets.botonjugar, 650, 200);
        playButton.addListener(new ButtonListener(playButton) {
            public void clicked(InputEvent event, float x, float y) {
                game.startGame();
            }
        });
        stage.addActor(playButton);

        exitButton = new Button(Assets.botonsalir, 650, 40);
        exitButton.addListener(new ButtonListener(exitButton) {
            public void clicked(InputEvent event, float x, float y) {
                Gdx.app.exit();
            }
        });
        stage.addActor(exitButton);

        soundButton = new SmallButton(Assets.soundon, Assets.soundoff, 40, 640);
        soundButton.addListener(new ButtonListener(soundButton) {
            public void clicked(InputEvent event, float x, float y) {
                soundButton.press();
                game.playsSound = !game.playsSound;
            }
        });
        stage.addActor(soundButton);

        windowButton = new SmallButton(Assets.botonwindowed, Assets.botonfullscreen, 200, 640);
        windowButton.addListener(new ButtonListener(windowButton) {
            public void clicked(InputEvent event, float x, float y) {
                windowButton.press();
                if (game.fullscreen) {
                    Gdx.graphics.setDisplayMode(1024, 768, false);
                } else {
                    Gdx.graphics.setDisplayMode(1024, 768, true);
                }
            }
        });
        stage.addActor(windowButton);
    }

    @Override
    public void render(float delta) {
        stage.act(delta);

        game.batch.begin();
        Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);
        game.batch.draw(background, 0, 0);
        game.batch.draw(title, 480, 420);
        game.batch.end();

        stage.draw();
    }

}
