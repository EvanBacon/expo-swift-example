import React from 'react';
import { StyleSheet, Text, View } from 'react-native';

import { NativeModules, NativeEventEmitter } from 'react-native';

const MODULE_NAME = 'DemoModule';
const { [MODULE_NAME]: Module } = NativeModules;

function testSend(name) {
  console.log(`${MODULE_NAME} Constants: `, Module.foo, Module.bar, Module);
  const eventEmitter = new NativeEventEmitter(Module);
  const listener = eventEmitter.addListener(
    'DemoModule.demoCallback',
    ({ message }) => {
      console.log('Received a swift event:', message);
    },
  );
  return Module.someMethod(name);
}

export default class App extends React.Component {
  state = { output: null };
  onPress = async () => {
    const output = await testSend('Bacon');
    this.setState({ output });
  };
  render() {
    const { output } = this.state;
    return (
      <View style={styles.container}>
        <Text onPress={this.onPress}>
          Press Me to Test {JSON.stringify(output || {})}
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
