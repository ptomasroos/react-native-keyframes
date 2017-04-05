import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  ScrollView,
  Dimensions,
  View,
  TouchableHighlight
} from 'react-native';

import { Keyframes } from '@ptomasroos/react-native-keyframes';

class Scene1 extends Component {
  componentDidMount() {
    if (this.flirtAnimation) {
      this.flirtAnimation.start();
    }

    if (this.likeAnimation) {
      this.likeAnimation.start();
    }

    if (this.nearAnimation) {
      this.nearAnimation.start();
    }
  }

  render() {
    return (
      <ScrollView>
        <Keyframes
          ref={ref => this.likeAnimation = ref}
          src={require('./like.kf.json')}
          style={{ width: 300, height: 300 }}
        />
        <Text style={styles.welcome}>
          Scene1
        </Text>
        <Text style={styles.welcome}>
          Scene1
        </Text>
        <Text style={styles.welcome}>
          Scene1
        </Text>
        <Text style={styles.welcome}>
          Scene1
        </Text>
        <Keyframes
          ref={ref => this.flirtAnimation = ref}
          src={require('./flirt.kf.json')}
          style={{ width: 300, height: 300 }}
        />
        <View style={{ flex: 1, flexDirection: 'row' }}>
          <TouchableHighlight onPress={() => this.flirtAnimation.start()}>
            <Text>Start</Text>
          </TouchableHighlight>
          <TouchableHighlight onPress={() => this.flirtAnimation.stop()}>
            <Text>Stop</Text>
          </TouchableHighlight>
          <TouchableHighlight onPress={() => this.flirtAnimation.seek(0.4)}>
            <Text>Seek to 1</Text>
          </TouchableHighlight>
          <TouchableHighlight onPress={() => this.flirtAnimation.playOnce()}>
            <Text>Play once</Text>
          </TouchableHighlight>
        </View>
        <Text style={styles.welcome}>
          Scene1
        </Text>
        <TouchableHighlight onPress={() => this.props.changeScene('Scene2')}>
          <Text>Go to Scene2</Text>
        </TouchableHighlight>
        <Text style={styles.welcome}>
          Scene1
        </Text>
        <Keyframes
          ref={ref => this.nearAnimation = ref}
          src={require('./near-you.kf.json')}
          style={{ width: 300, height: 300 }}
        />
        <Text style={styles.welcome}>
          Scene1
        </Text>
        <Text style={styles.welcome}>
          Scene1
        </Text>
        <Text style={styles.welcome}>
          Scene1
        </Text>
        <Text style={styles.welcome}>
          Scene1
        </Text>
        <Text style={styles.welcome}>
          Scene1
        </Text>
        <Text style={styles.welcome}>
          Scene1
        </Text>
      </ScrollView>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F5FCFF'
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10
  }
});

export default Scene1;
