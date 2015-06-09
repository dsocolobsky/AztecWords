package com.atomicsoftware.aztecwords;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureAtlas.*;

public class Assets {

    // Fondos
    public static Texture background;
    public static Texture menutexture;
    public static Texture hudtexture;

    // El Spritesheet (spritesheet.atlas)
    public static TextureAtlas spritesheet;

    // Botones
    public static AtlasRegion botonfullscreen;
    public static AtlasRegion botonwindowed;
    public static AtlasRegion botonjugar;
    public static AtlasRegion botonsalir;
    public static AtlasRegion soundoff;
    public static AtlasRegion soundon;

    // Titulo y Game Over
    public static AtlasRegion titulo;
    public static AtlasRegion gameover;

    // Otros
    public static AtlasRegion corazon;
    public static AtlasRegion pozo;

    // Jugador
    public static AtlasRegion[] playersheet;

    public static void load() {
        // Load backgrounds
        background = loadTexture("background.png");
        menutexture = loadTexture("menu.png");
        hudtexture = loadTexture("hud.png");
        // Maybe load the splash one day

        // Create the spritesheet
        spritesheet = new TextureAtlas(Gdx.files.internal("textures/spritesheet.atlas"));

        // Unpack it into the different AtlasRegions
        botonfullscreen = spritesheet.findRegion("botonfullscreen");
        botonwindowed = spritesheet.findRegion("botonwindowed");
        botonjugar = spritesheet.findRegion("botonjugar");
        botonsalir = spritesheet.findRegion("botonsalir");
        soundoff = spritesheet.findRegion("soundoff");
        soundon = spritesheet.findRegion("soundon");

        titulo = spritesheet.findRegion("titulo");
        gameover = spritesheet.findRegion("gameover");

        corazon = spritesheet.findRegion("corazon");
        pozo = spritesheet.findRegion("pozo");

        // Load the player's 8 AtlasRegions
        playersheet = new AtlasRegion[8];
        for(int i = 0; i < 8; i++) {
            playersheet[i] = spritesheet.findRegion("player" + (i+1));
        }
    }

    public static void dispose() {
        background.dispose();
        menutexture.dispose();
        hudtexture.dispose();
        spritesheet.dispose();
    }

    private static Texture loadTexture(String file) {
        return new Texture(Gdx.files.internal("textures/" + file));
    }
}
