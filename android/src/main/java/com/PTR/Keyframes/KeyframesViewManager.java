package com.PTR.Keyframes;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.common.MapBuilder;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

import java.util.Map;

import javax.annotation.Nullable;

public class KeyframesViewManager extends SimpleViewManager<KeyframesView> {


    public static final int COMMAND_START = 1;
    public static final int COMMAND_STOP = 2;
    public static final int COMMAND_PLAY_ONCE = 3;
    public static final int COMMAND_SEEK = 4;

    @Override
    public String getName() {
        return "PTRKeyframesView";
    }

    @Override
    protected KeyframesView createViewInstance(ThemedReactContext themedReactContext) {
        return new KeyframesView(themedReactContext);
    }

    @ReactProp(name = "src")
    public void setSrc(final KeyframesView keyframeView, ReadableMap src) {
        keyframeView.setSrc(src);
    }

    @Override
    public @Nullable Map<String, Integer> getCommandsMap() {
        return MapBuilder.of(
                "start", COMMAND_START,
                "stop", COMMAND_STOP,
                "playOnce", COMMAND_PLAY_ONCE,
                "seek", COMMAND_SEEK
        );
    }

    @Override
    public void receiveCommand(KeyframesView root, int commandId, @Nullable ReadableArray args) {
        switch (commandId) {
            case COMMAND_START:
                root.start();
                break;
            case COMMAND_STOP:
                root.stop();
                break;
            case COMMAND_PLAY_ONCE:
                root.playOnce();
                break;
            case COMMAND_SEEK:
                root.seek(args.getDouble(0));
                break;
        }
    }
}