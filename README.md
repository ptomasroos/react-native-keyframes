# react-native-keyframes

React Native wrapper for Facebook Keyframes with a imperative api.
We use this in production and will continuously improve it when needed.

Demands usage of cocoapods in order to get transient dependencies
Support RN > 0.56

[![Build Status](https://travis-ci.com/ptomasroos/react-native-keyframes.svg?branch=master)](https://travis-ci.com/ptomasroos/react-native-keyframes) [![npm version](https://badge.fury.io/js/react-native-keyframes.svg)](https://badge.fury.io/js/react-native-keyframes) [![npm downloads](https://img.shields.io/npm/dm/react-native-keyframes.svg)](https://www.npmjs.com/package/react-native-keyframes)

## How to install

```
npm install react-native-keyframes
react-native link
```

You need to use Cocoapods because this project depends on the pod keyframes, make sure to add the following to your Podfile

## Podfile
```
  pod 'react-native-keyframes',  path: '../node_modules/react-native-keyframes'
```

## How to use!

How to use!
Checkout the app in ```examples/Basic``` fully runnable.


## Acknowledgements

I stole some code from https://github.com/underscopeio/react-native-facebook-keyframes, thanks for that boiler plate!