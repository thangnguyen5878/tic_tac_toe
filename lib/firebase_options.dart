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
    appId: '1:405399125660:android:22903e611f322c1ea83759',
    messagingSenderId: '405399125660',
    projectId: 'tic-tac-toe-63520',
    storageBucket: 'tic-tac-toe-63520.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbQFejA8VzZLtN9YpYg7nxHqSCwWxuBbk',
    appId: '1:405399125660:ios:7bccdc9160cb3368a83759',
    messagingSenderId: '405399125660',
    projectId: 'tic-tac-toe-63520',
    storageBucket: 'tic-tac-toe-63520.appspot.com',
    androidClientId: '405399125660-o1gmask5clj895oca7rj4fdkhm6spgba.apps.googleusercontent.com',
    iosClientId: '405399125660-a71mikcvmcdtl09fmj20ndceifh3tti2.apps.googleusercontent.com',
    iosBundleId: 'com.thang5878.flutterTicTacToe',
  );
}
