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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCmHXkzcRN_pXSJr0eVAoNl4AD2gk9qgLM',
    appId: '1:912195814616:web:15da0aa6dcf39a03d343ad',
    messagingSenderId: '912195814616',
    projectId: 'instagram-914a4',
    authDomain: 'instagram-914a4.firebaseapp.com',
    storageBucket: 'instagram-914a4.appspot.com',
    measurementId: 'G-NLY3HDP1B6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBETKm9OdhPlue5XHFDo8e5JYy-6sAgMqc',
    appId: '1:912195814616:android:ae76aac7d03704d2d343ad',
    messagingSenderId: '912195814616',
    projectId: 'instagram-914a4',
    storageBucket: 'instagram-914a4.appspot.com',
  );
}
