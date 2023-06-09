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
    apiKey: 'AIzaSyAL1bOoniCRlNhn_dyJ0C4HRIW8j5AHOVw',
    appId: '1:578468705609:web:3ed3e92e2715e70444d698',
    messagingSenderId: '578468705609',
    projectId: 'happyfamily-2a38e',
    authDomain: 'happyfamily-2a38e.firebaseapp.com',
    storageBucket: 'happyfamily-2a38e.appspot.com',
    measurementId: 'G-T72NTTD3R8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_xncM2i1ksUotvZI5kwcTKrUYt_vgTLk',
    appId: '1:578468705609:android:6188616482fd2a2344d698',
    messagingSenderId: '578468705609',
    projectId: 'happyfamily-2a38e',
    storageBucket: 'happyfamily-2a38e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUBJsYsscmcZyUTEkrsPi3GPC13sbtQ1I',
    appId: '1:578468705609:ios:3d16dcfe6b6bf96844d698',
    messagingSenderId: '578468705609',
    projectId: 'happyfamily-2a38e',
    storageBucket: 'happyfamily-2a38e.appspot.com',
    iosClientId: '578468705609-lkkpakh7ddcqgdoocaug2k9l4unuqqsq.apps.googleusercontent.com',
    iosBundleId: 'com.invain.happyfamily.happyFamily',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUBJsYsscmcZyUTEkrsPi3GPC13sbtQ1I',
    appId: '1:578468705609:ios:3d16dcfe6b6bf96844d698',
    messagingSenderId: '578468705609',
    projectId: 'happyfamily-2a38e',
    storageBucket: 'happyfamily-2a38e.appspot.com',
    iosClientId: '578468705609-lkkpakh7ddcqgdoocaug2k9l4unuqqsq.apps.googleusercontent.com',
    iosBundleId: 'com.invain.happyfamily.happyFamily',
  );
}
