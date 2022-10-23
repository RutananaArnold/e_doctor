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
    apiKey: 'AIzaSyD3HcZID_XBeL3NT4ZYhX4oD6due0NC6C8',
    appId: '1:192029205621:web:51ea228e50a6119a72843c',
    messagingSenderId: '192029205621',
    projectId: 'edoctor-51932',
    authDomain: 'edoctor-51932.firebaseapp.com',
    storageBucket: 'edoctor-51932.appspot.com',
    measurementId: 'G-RVBWRYWDX2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmE1lBM2fisN-rCu-45i9EzWvMC1FMvSE',
    appId: '1:192029205621:android:d30abb922a41a27a72843c',
    messagingSenderId: '192029205621',
    projectId: 'edoctor-51932',
    storageBucket: 'edoctor-51932.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9rwKoiPd9cj3AJoEc50F_QXG-5-Tqoh8',
    appId: '1:192029205621:ios:e80545114bb1486572843c',
    messagingSenderId: '192029205621',
    projectId: 'edoctor-51932',
    storageBucket: 'edoctor-51932.appspot.com',
    iosClientId: '192029205621-j8s26bi1qju4pc033h01pf3guqh8er9n.apps.googleusercontent.com',
    iosBundleId: 'com.example.eDoctor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA9rwKoiPd9cj3AJoEc50F_QXG-5-Tqoh8',
    appId: '1:192029205621:ios:e80545114bb1486572843c',
    messagingSenderId: '192029205621',
    projectId: 'edoctor-51932',
    storageBucket: 'edoctor-51932.appspot.com',
    iosClientId: '192029205621-j8s26bi1qju4pc033h01pf3guqh8er9n.apps.googleusercontent.com',
    iosBundleId: 'com.example.eDoctor',
  );
}
