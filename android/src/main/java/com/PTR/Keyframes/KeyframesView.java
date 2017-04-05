package com.PTR.Keyframes;

import android.view.View;
import android.widget.ImageView;

import com.facebook.keyframes.KeyframesDrawable;
import com.facebook.keyframes.KeyframesDrawableBuilder;
import com.facebook.keyframes.deserializers.KFImageDeserializer;
import com.facebook.keyframes.model.KFImage;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReadableMap;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

public class KeyframesView extends ImageView {
    private KeyframesDrawable mKeyFramesDrawable;

    public KeyframesView(ReactContext reactContext) {
        super(reactContext);
    }

    public void setSrc(final ReadableMap src) {
        String descriptorString = src.toString()
                .replaceAll("^\\{ NativeMap: ", "")
                .replaceAll("\\}$", "");

        InputStream stream = new ByteArrayInputStream(descriptorString.getBytes());
        KFImage kfImage;

        try {
            kfImage = KFImageDeserializer.deserialize(stream);
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }
        setKFImage(kfImage);
    }

    public void start() {
        this.mKeyFramesDrawable.startAnimation();
    }

    public void stop() {
        this.mKeyFramesDrawable.stopAnimation();
    }

    public void playOnce() {
        this.mKeyFramesDrawable.playOnce();
    }

    public void seek(double position) {
        this.mKeyFramesDrawable.seekToProgress((float)position);
    }

    private void setKFImage(KFImage kfImage) {
        this.mKeyFramesDrawable = new KeyframesDrawableBuilder().withImage(kfImage).build();
        this.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        this.setImageDrawable(this.mKeyFramesDrawable);
        this.setImageAlpha(0);
    }
}