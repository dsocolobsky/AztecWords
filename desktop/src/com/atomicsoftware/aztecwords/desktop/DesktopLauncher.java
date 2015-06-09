package com.atomicsoftware.aztecwords.desktop;

import com.badlogic.gdx.backends.lwjgl.LwjglApplication;
import com.badlogic.gdx.backends.lwjgl.LwjglApplicationConfiguration;
import com.atomicsoftware.aztecwords.AztecWords;
import com.badlogic.gdx.tools.texturepacker.TexturePacker;

public class DesktopLauncher {
	public static void main (String[] arg) {
		LwjglApplicationConfiguration config = new LwjglApplicationConfiguration();

		config.width = 1024;
		config.height = 768;

		TexturePacker.Settings settings = new TexturePacker.Settings();
		TexturePacker.process(settings, "topack", "textures", "spritesheet");

		new LwjglApplication(new AztecWords(), config);
	}
}
