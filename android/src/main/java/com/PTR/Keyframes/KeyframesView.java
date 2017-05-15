package com.PTR.Keyframes;

import android.view.View;
import android.widget.ImageView;

import com.facebook.keyframes.KeyframesDrawable;
import com.facebook.keyframes.KeyframesDrawable.OnAnimationEnd;
import com.facebook.keyframes.KeyframesDrawableBuilder;
import com.facebook.keyframes.deserializers.KFImageDeserializer;
import com.facebook.keyframes.model.KFImage;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.events.RCTEventEmitter;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

public class KeyframesView extends ImageView implements OnAnimationEnd {
    private ThemedReactContext mThemedReactcontext;
    private KeyframesDrawable mKeyFramesDrawable;

    public KeyframesView(ThemedReactContext themedReactContext) {
        super(themedReactContext);

        mThemedReactcontext = themedReactContext;
    }

    public void setSrc(final ReadableMap src) {
        String descriptorString = src.toString()
                .replaceAll("^\\{ NativeMap: ", "")
                .replaceAll("\\}$", "");

        InputStream stream = new ByteArrayInputStream(descriptorString.getBytes());
        KFImage kfImage;

        try {
            kfImage = KFImageDeserializer.deserialize(stream);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
        setKFImage(kfImage);
    }

    public void start() {
        this.mKeyFramesDrawable.setAnimationListener(this);
        this.mKeyFramesDrawable.startAnimation();
    }

    public void stop() {
        this.mKeyFramesDrawable.stopAnimation();
    }

    public void playOnce() {
        this.mKeyFramesDrawable.setAnimationListener(this);
        this.mKeyFramesDrawable.playOnce();
    }

    public void seek(double position) {
        this.mKeyFramesDrawable.seekToProgress((float) position);
    }

    public void destroy() {
        this.setImageDrawable(null);
        this.mKeyFramesDrawable = null;
    }

    private void setKFImage(KFImage kfImage) {
        this.mKeyFramesDrawable = new KeyframesDrawableBuilder().withImage(kfImage).build();
        this.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        this.setImageDrawable(this.mKeyFramesDrawable);
        this.setImageAlpha(0);
    }

    @Override
    public void onAnimationEnd() {
        mThemedReactcontext
                .getJSModule(RCTEventEmitter.class)
                .receiveEvent(this.getId(), Events.EVENT_ON_STOP.toString(), null);
    }

    public enum Events {
        EVENT_ON_STOP("onStop");

        private final String mName;

        Events(final String name) {
            mName = name;
        }

        @Override
        public String toString() {
            return mName;
        }
    }
}