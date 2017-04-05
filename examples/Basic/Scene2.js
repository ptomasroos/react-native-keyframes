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

class Scene2 extends Component {
  render() {
    return (
      <ScrollView>
        <Text style={styles.welcome}>
          Scene2
        </Text>
        <Keyframes
          src={require('./flirt.kf.json')}
          style={{ width: 300, height: 300 }}
        />
        <Text style={styles.welcome}>
          Scene2
        </Text>
        <Text style={styles.welcome}>
          Scene2
        </Text>
        <Keyframes
          src={require('./like.kf.json')}
          style={{ width: 300, height: 300 }}
        />
        <Text style={styles.welcome}>
          Scene2
        </Text>
        <Text style={styles.welcome}>
          Scene2
        </Text>
        <Keyframes
          src={require('./near-you.kf.json')}
          style={{ width: 300, height: 300 }}
        />
        <TouchableHighlight onPress={() => this.props.changeScene('Scene1')}>
          <Text>Go to Scene1</Text>
        </TouchableHighlight>
        <Text style={styles.welcome}>
          Scene2
        </Text>
        <Text style={styles.welcome}>
          Scene2
        </Text>
        <Text style={styles.welcome}>
          Scene2
        </Text>
        <Text style={styles.welcome}>
          Scene2
        </Text>
        <Text style={styles.welcome}>
          Scene2
        </Text>
        <Text style={styles.welcome}>
          Scene2
        </Text>
        <Text style={styles.welcome}>
          Scene2
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

export default Scene2;
