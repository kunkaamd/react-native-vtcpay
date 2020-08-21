/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  Platform,
  NativeModules,
  Button
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';

var VTCPay = NativeModules.VTCPay;

const App: () => React$Node = () => {
  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView>
        <ScrollView
          contentInsetAdjustmentBehavior="automatic"
          style={styles.scrollView}>
          <Header />
          {global.HermesInternal == null ? null : (
            <View style={styles.engine}>
              <Text style={styles.footer}>Engine: Hermes</Text>
            </View>
          )}
          <Button
            onPress={
              () => {
                if(Platform.OS === 'ios') {
                  VTCPay.paymentAction(
                    500052059,//appid
                    "0357758300",//accountName
                    "123456",//"secrectKey (password cua app)"
                    0,//paymentType
                    500000,//amount
                    "0357758300",//"receiverAccount",
                    "123455432",//orderCode(i guess this is my order_id)
                    (responseCode,description) => {
                      console.log("ios===>",responseCode,description);
                    }
                  );
                } else { //android
                  VTCPay.paymentAction(
                    500052059,//appid
                    "0357758300",//accountName
                    "123456",//"secrectKey (password cua app)"
                    0,//paymentType
                    500000,//amount
                    "0357758300",//"receiverAccount",
                    "123455432",//orderCode(i guess this is my order_id)
                    (responseCode,description) => {
                      console.log("android===>",responseCode,description);
                    }
                  );
                }
              }
            }
            title="TEST"
            color="#841584"
            accessibilityLabel="Learn more about this purple button"
          />
        </ScrollView>
      </SafeAreaView>
    </>
  );
};

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});

export default App;
