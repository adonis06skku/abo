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
    apiKey: 'AIzaSyD_vSRTetdH6Aqe2UMJogT6C6yNeXOnpcg',
    appId: '1:70320968532:web:978d25f1f4f12a8b016ec1',
    messagingSenderId: '70320968532',
    projectId: 'adonis-kbo',
    authDomain: 'adonis-kbo.firebaseapp.com',
    storageBucket: 'adonis-kbo.appspot.com',
    measurementId: 'G-TSLYWXQ4VQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDp5Cv2lFeXy1SbLNmWWIVYWyP1flt3X3o',
    appId: '1:70320968532:android:dc2e1eed0aa5c212016ec1',
    messagingSenderId: '70320968532',
    projectId: 'adonis-kbo',
    storageBucket: 'adonis-kbo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3hlzUG5KvqQk84Cs60bRRptyjRrrUyBU',
    appId: '1:70320968532:ios:68f5fd021332829a016ec1',
    messagingSenderId: '70320968532',
    projectId: 'adonis-kbo',
    storageBucket: 'adonis-kbo.appspot.com',
    iosBundleId: 'com.adonis.abo',
  );
}