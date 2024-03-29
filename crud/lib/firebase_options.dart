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
    apiKey: 'AIzaSyAN5qK349i8rdN6oWGnfnUTIvKR2dGr0HY',
    appId: '1:887595471019:web:5f1a440c51fda66268a7ee',
    messagingSenderId: '887595471019',
    projectId: 'projeto1-66557',
    authDomain: 'projeto1-66557.firebaseapp.com',
    storageBucket: 'projeto1-66557.appspot.com',
    measurementId: 'G-5KXW1QYTG0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCntoT3DASXAFcm9ruoUeYklH-MbCLGCas',
    appId: '1:887595471019:android:5357a4b4cbf8f23568a7ee',
    messagingSenderId: '887595471019',
    projectId: 'projeto1-66557',
    storageBucket: 'projeto1-66557.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAm8fTFEvDk6fbGfSty-aTsXc4BBIoSnxg',
    appId: '1:887595471019:ios:1057ef19a56af4c968a7ee',
    messagingSenderId: '887595471019',
    projectId: 'projeto1-66557',
    storageBucket: 'projeto1-66557.appspot.com',
    iosClientId: '887595471019-otolqtej0jhpg9h6h9g4p69ioivp0v29.apps.googleusercontent.com',
    iosBundleId: 'com.example.projetoAula',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAm8fTFEvDk6fbGfSty-aTsXc4BBIoSnxg',
    appId: '1:887595471019:ios:1057ef19a56af4c968a7ee',
    messagingSenderId: '887595471019',
    projectId: 'projeto1-66557',
    storageBucket: 'projeto1-66557.appspot.com',
    iosClientId: '887595471019-otolqtej0jhpg9h6h9g4p69ioivp0v29.apps.googleusercontent.com',
    iosBundleId: 'com.example.projetoAula',
  );
}
