package com.atomicsoftware.aztecwords;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.utils.ClickListener;

public class ButtonListener extends ClickListener {

    private Button button;

    public ButtonListener(Button button) {
        this.button = button;
    }

    @Override
    public void enter(InputEvent event, float x, float y, int pointer, Actor fromActor) {
        button.hover();
    }

    public void exit(InputEvent event, float x, float y, int pointer, Actor fromActor) {
        button.dehover();
    }

}
