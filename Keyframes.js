// @flow
import * as React from 'react';
import {
  requireNativeComponent,
  UIManager,
  findNodeHandle,
  View,
} from 'react-native';

const PTRKeyframesView = requireNativeComponent('PTRKeyframesView');

type Props = React.ElementConfig<typeof View> & {
  onStop: Function,
};

class Keyframes extends React.Component<Props> {
  ref = React.createRef<typeof PTRKeyframesView>();

  constructor(props: Props) {
    super(props);
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

  runCommand(name: string, args?: Array<number> = []) {
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
