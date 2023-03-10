// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:hanafuda_record/configs/config.dart';

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

  static FirebaseOptions web = FirebaseOptions(
    apiKey: Config.webInfo['apiKey']!,
    appId: Config.webInfo['appId']!,
    messagingSenderId: Config.webInfo['messagingSenderId']!,
    projectId: Config.webInfo['projectId']!,
    authDomain: Config.webInfo['authDomain']!,
    storageBucket: Config.webInfo['storageBucket']!,
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: Config.androidInfo['apiKey']!,
    appId: Config.androidInfo['appId']!,
    messagingSenderId: Config.androidInfo['messagingSenderId']!,
    projectId: Config.androidInfo['projectId']!,
    storageBucket: Config.androidInfo['storageBucket']!,
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: Config.iosInfo['apiKey']!,
    appId: Config.iosInfo['appId']!,
    messagingSenderId: Config.iosInfo['messagingSenderId']!,
    projectId: Config.iosInfo['projectId']!,
    storageBucket: Config.iosInfo['storageBucket']!,
    iosClientId: Config.iosInfo['iosClientId']!,
    iosBundleId: Config.iosInfo['iosBundleId']!,
  );

  static FirebaseOptions macos = FirebaseOptions(
    apiKey: Config.macInfo['apiKey']!,
    appId: Config.macInfo['appId']!,
    messagingSenderId: Config.macInfo['messagingSenderId']!,
    projectId: Config.macInfo['projectId']!,
    storageBucket: Config.macInfo['storageBucket']!,
    iosClientId: Config.macInfo['iosClientId']!,
    iosBundleId: Config.macInfo['iosBundleId']!,
  );
}
