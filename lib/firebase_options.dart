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
    apiKey: 'AIzaSyA0pXjeYp4noxpntW01UCsavhVBXDg_K6U',
    appId: '1:304709513674:web:880dedafedbaa488795f33',
    messagingSenderId: '304709513674',
    projectId: 'ktask-a7f3b',
    authDomain: 'ktask-a7f3b.firebaseapp.com',
    storageBucket: 'ktask-a7f3b.appspot.com',
    measurementId: 'G-HVHW52DW6B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmVaNUbS37THAy3VpM-2OHefSLqVsW8Qc',
    appId: '1:304709513674:android:9bc77fe4e33c54a5795f33',
    messagingSenderId: '304709513674',
    projectId: 'ktask-a7f3b',
    storageBucket: 'ktask-a7f3b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJjhkZX-w4n4ZO_DgTsQWCxkzMEPqJlgk',
    appId: '1:304709513674:ios:484d8b40afa0f0f6795f33',
    messagingSenderId: '304709513674',
    projectId: 'ktask-a7f3b',
    storageBucket: 'ktask-a7f3b.appspot.com',
    androidClientId: '304709513674-cs8ot15f4crnkf4sunvkfarts4uep2lj.apps.googleusercontent.com',
    iosClientId: '304709513674-gua8dcel9brg138bo1fc12lnj0ead540.apps.googleusercontent.com',
    iosBundleId: 'com.example.kuunganatask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJjhkZX-w4n4ZO_DgTsQWCxkzMEPqJlgk',
    appId: '1:304709513674:ios:484d8b40afa0f0f6795f33',
    messagingSenderId: '304709513674',
    projectId: 'ktask-a7f3b',
    storageBucket: 'ktask-a7f3b.appspot.com',
    androidClientId: '304709513674-cs8ot15f4crnkf4sunvkfarts4uep2lj.apps.googleusercontent.com',
    iosClientId: '304709513674-gua8dcel9brg138bo1fc12lnj0ead540.apps.googleusercontent.com',
    iosBundleId: 'com.example.kuunganatask',
  );
}