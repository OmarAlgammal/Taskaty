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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIZChgFIChM_zF5MZMAafl06BcWEOS-s8',
    appId: '1:713217312380:android:05808b731f05a265ac6bf9',
    messagingSenderId: '713217312380',
    projectId: 'taksaty-4ca3c',
    storageBucket: 'taksaty-4ca3c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUsoVDWyY6991kmW0hAnzwnFwKnhoAHRE',
    appId: '1:713217312380:ios:5b11484a38e98821ac6bf9',
    messagingSenderId: '713217312380',
    projectId: 'taksaty-4ca3c',
    storageBucket: 'taksaty-4ca3c.appspot.com',
    androidClientId: '713217312380-4cdba8j3n0tdtsgqh02usl7hji445icj.apps.googleusercontent.com',
    iosClientId: '713217312380-2f8702p9un0sh0c23cpbupcv6hatvpq2.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskaty',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCQaLfvpRo8imhOvZh2oYVPadV6qWTILvw',
    appId: '1:713217312380:web:2e94e86a77d1e3ffac6bf9',
    messagingSenderId: '713217312380',
    projectId: 'taksaty-4ca3c',
    authDomain: 'taksaty-4ca3c.firebaseapp.com',
    storageBucket: 'taksaty-4ca3c.appspot.com',
    measurementId: 'G-SQW15R512N',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBUsoVDWyY6991kmW0hAnzwnFwKnhoAHRE',
    appId: '1:713217312380:ios:6c5d96722ef9971cac6bf9',
    messagingSenderId: '713217312380',
    projectId: 'taksaty-4ca3c',
    storageBucket: 'taksaty-4ca3c.appspot.com',
    androidClientId: '713217312380-4cdba8j3n0tdtsgqh02usl7hji445icj.apps.googleusercontent.com',
    iosClientId: '713217312380-nd94hd2bf0087q443mg5elau7j8ud47e.apps.googleusercontent.com',
    iosBundleId: 'com.omarprogramzone.taskaty.taskaty',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCQaLfvpRo8imhOvZh2oYVPadV6qWTILvw',
    appId: '1:713217312380:web:c5541f72c6b80838ac6bf9',
    messagingSenderId: '713217312380',
    projectId: 'taksaty-4ca3c',
    authDomain: 'taksaty-4ca3c.firebaseapp.com',
    storageBucket: 'taksaty-4ca3c.appspot.com',
    measurementId: 'G-D2BTDHSBTJ',
  );

}