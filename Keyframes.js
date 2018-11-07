// @flow
import * as React from 'react';
import {
  requireNativeComponent,
  UIManager,
  findNodeHandle,
  View,
} from 'react-native';

const PTRKeyframesView = requireNativeComponent('PTRKeyframesView', Keyframes);

type Props = React.ElementConfig<typeof View> & {
  onStop: Function,
};

class Keyframes extends React.Component<Props> {
  constructor(props) {
    super(props);

    this.ref = React.createRef();
  }

  onStop = () => {
    if (this.props.onStop) {
      this.props.onStop();
    }
  };

  render() {
    return (
      <PTRKeyframesView onStop={this.onStop} ref={this.ref} {...this.props} />
    );
  }

  seek(position: number) {
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

  pause() {
    this.runCommand('pause');
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
    return findNodeHandle(this.ref.current);
  }
}

export default Keyframes;
