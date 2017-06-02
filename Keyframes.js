import React, { PropTypes } from 'react';
import {
  NativeModules,
  requireNativeComponent,
  View,
  UIManager,
  findNodeHandle,
} from 'react-native';

const PTRKeyframesView = requireNativeComponent('PTRKeyframesView', Keyframes);

class Keyframes extends React.Component {
  constructor(props) {
    super(props);
    this.onStop = this.onStop.bind(this);
  }

  onStop(e) {
    this.props.onStop && this.props.onStop();
  }

  render() {
    return (
      <PTRKeyframesView
        onStop={this.onStop}
        ref={ref => (this.ref = ref)}
        {...this.props}
      />
    );
  }

  seek(position) {
    this.runCommand('seek', [position]);
  }

  playOnce() {
    this.runCommand('playOnce');
  }

  start() {
    this.runCommand('start');
  }

  stop() {
    this.runCommand('stop');
  }

  resume() {
    this.runCommand('resume');
  }

  runCommand(name, args = []) {
    UIManager.dispatchViewManagerCommand(
      this.getHandle(),
      UIManager.PTRKeyframesView.Commands[name],
      args,
    );
  }

  getHandle() {
    return findNodeHandle(this.ref);
  }
}

export default Keyframes;
