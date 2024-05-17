// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBa-IKPrAoZDPIQUdHjGbJHqFNwd2-pr24',
    appId: '1:720209860717:web:90b09c13025ac00605c764',
    messagingSenderId: '720209860717',
    projectId: 'chatapp-83888',
    authDomain: 'chatapp-83888.firebaseapp.com',
    storageBucket: 'chatapp-83888.appspot.com',
    measurementId: 'G-TXN8NPBXKR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWrF9WJHJDoVrnPtz7oR1tMsfu4Jr5igI',
    appId: '1:720209860717:android:2039c4f4c80fe0fe05c764',
    messagingSenderId: '720209860717',
    projectId: 'chatapp-83888',
    storageBucket: 'chatapp-83888.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDefbW0wCR_RwtIZowgovhonHxiaNAUxAM',
    appId: '1:720209860717:ios:d50f58ef8a92f32405c764',
    messagingSenderId: '720209860717',
    projectId: 'chatapp-83888',
    storageBucket: 'chatapp-83888.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDefbW0wCR_RwtIZowgovhonHxiaNAUxAM',
    appId: '1:720209860717:ios:d50f58ef8a92f32405c764',
    messagingSenderId: '720209860717',
    projectId: 'chatapp-83888',
    storageBucket: 'chatapp-83888.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBa-IKPrAoZDPIQUdHjGbJHqFNwd2-pr24',
    appId: '1:720209860717:web:b388202a6b93719705c764',
    messagingSenderId: '720209860717',
    projectId: 'chatapp-83888',
    authDomain: 'chatapp-83888.firebaseapp.com',
    storageBucket: 'chatapp-83888.appspot.com',
    measurementId: 'G-ZFCGFRX903',
  );
}
