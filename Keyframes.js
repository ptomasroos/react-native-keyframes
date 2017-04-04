import React, { PropTypes } from 'react';
import { NativeModules, requireNativeComponent, View } from 'react-native';

const PTRKeyframesView = requireNativeComponent('PTRKeyframesView', Keyframes);

class Keyframes extends React.Component {
  render() {
    return <PTRKeyframesView {...this.props} />;
  }
}

export default Keyframes;
