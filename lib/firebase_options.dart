// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC3QgqQodYIHO3RziDwneDleH-hnS37P5c',
    appId: '1:916332478403:web:c1aa1e12fd8b74f9338776',
    messagingSenderId: '916332478403',
    projectId: 'flutter-notifications-90077',
    authDomain: 'flutter-notifications-90077.firebaseapp.com',
    storageBucket: 'flutter-notifications-90077.appspot.com',
    measurementId: 'G-312EX91DX7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLZoUTs_oWlNw0E8e_pR8Q-E4YD5oMIKw',
    appId: '1:916332478403:android:d86d554c25381d82338776',
    messagingSenderId: '916332478403',
    projectId: 'flutter-notifications-90077',
    storageBucket: 'flutter-notifications-90077.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVROziIMDLYn9JAg21962CzC1TBsNssd0',
    appId: '1:916332478403:ios:982e88f1d06c5c5c338776',
    messagingSenderId: '916332478403',
    projectId: 'flutter-notifications-90077',
    storageBucket: 'flutter-notifications-90077.appspot.com',
    iosClientId: '916332478403-qjh5lf12i64pvlt119r4dsv5qiruhgt3.apps.googleusercontent.com',
    iosBundleId: 'manu.dev.practices',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDVROziIMDLYn9JAg21962CzC1TBsNssd0',
    appId: '1:916332478403:ios:1364390eb651390a338776',
    messagingSenderId: '916332478403',
    projectId: 'flutter-notifications-90077',
    storageBucket: 'flutter-notifications-90077.appspot.com',
    iosClientId: '916332478403-e000b1i52c966oiks8lk6d4hjfothnkh.apps.googleusercontent.com',
    iosBundleId: 'com.example.practices.RunnerTests',
  );
}