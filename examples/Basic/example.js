import React, { Component } from 'react';
import { AppRegistry, Text, View } from 'react-native';

import Scene1 from './Scene1';
import Scene2 from './Scene2';

class Basic extends Component {
  state = {
    scene: 'Scene1'
  };

  changeScene = scene => {
    this.setState({ scene: scene });
  };

  render() {
    if (this.state.scene === 'Scene1') {
      return <Scene1 changeScene={this.changeScene} />;
    } else if (this.state.scene === 'Scene2') {
      return <Scene2 changeScene={this.changeScene} />;
    }

    return (
      <View style={{ flex: 1 }}>
        <Text>No scene could be rendered?</Text>
      </View>
    );
  }
}

export default Basic;
