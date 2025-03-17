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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtDTFw-e7DvtbBIuKqJe5cueSBhI1ddF4',
    appId: '1:405399125660:android:a091ae1f3af2944fa83759',
    messagingSenderId: '405399125660',
    projectId: 'tic-tac-toe-63520',
    storageBucket: 'tic-tac-toe-63520.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbQFejA8VzZLtN9YpYg7nxHqSCwWxuBbk',
    appId: '1:405399125660:ios:d1ea4cae6c6df18ba83759',
    messagingSenderId: '405399125660',
    projectId: 'tic-tac-toe-63520',
    storageBucket: 'tic-tac-toe-63520.firebasestorage.app',
    androidClientId: '405399125660-06msopft7dkkjt9t2rltdii86rr22qp7.apps.googleusercontent.com',
    iosClientId: '405399125660-rf34h6f32qmtb4sg9esgodp7m33ef7mi.apps.googleusercontent.com',
    iosBundleId: 'com.example.ticTacToe',
  );

}