import React, { PropTypes } from 'react';
import {
  NativeModules,
  requireNativeComponent,
  View,
  UIManager,
  findNodeHandle
} from 'react-native';

const PTRKeyframesView = requireNativeComponent('PTRKeyframesView', Keyframes);

class Keyframes extends React.Component {
  render() {
    return <PTRKeyframesView ref={ref => this.ref = ref} {...this.props} />;
  }

  seek(position) {
    this.runCommand('seek', [position]);
  }

  playOnce(count) {
    this.runCommand('playOnce');
  }

  start() {
    this.runCommand('start');
  }

  stop() {
    this.runCommand('stop');
  }

  runCommand(name, args = []) {
    UIManager.dispatchViewManagerCommand(
      this.getHandle(),
      UIManager.PTRKeyframesView.Commands[name],
      args
    );
  }

  getHandle() {
    return findNodeHandle(this.ref);
  }
}

export default Keyframes;
