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
    apiKey: 'AIzaSyD0W6PM2U9YCW35MQPZHnoiPE7r3HzD4QY',
    appId: '1:517039412881:web:38910ae627fc5147621130',
    messagingSenderId: '517039412881',
    projectId: 'nearbystore-87beb',
    authDomain: 'nearbystore-87beb.firebaseapp.com',
    storageBucket: 'nearbystore-87beb.appspot.com',
    measurementId: 'G-NTZRWNTGF3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBapCB83BxGyjA_urU_YMl2RnzxIRcyQhA',
    appId: '1:517039412881:android:c4f48eedd313ddcd621130',
    messagingSenderId: '517039412881',
    projectId: 'nearbystore-87beb',
    storageBucket: 'nearbystore-87beb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFWDgcFQec-8bcWbSN_0kVxxnpoH1RiaQ',
    appId: '1:517039412881:ios:6eca1e36bebcd03e621130',
    messagingSenderId: '517039412881',
    projectId: 'nearbystore-87beb',
    storageBucket: 'nearbystore-87beb.appspot.com',
    iosBundleId: 'com.example.nearByStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFWDgcFQec-8bcWbSN_0kVxxnpoH1RiaQ',
    appId: '1:517039412881:ios:994c87954a0ad680621130',
    messagingSenderId: '517039412881',
    projectId: 'nearbystore-87beb',
    storageBucket: 'nearbystore-87beb.appspot.com',
    iosBundleId: 'com.example.nearByStore.RunnerTests',
  );
}
