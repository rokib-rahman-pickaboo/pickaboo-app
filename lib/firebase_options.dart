// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDb_YxftrBJCypzxA3YPCf94kUeFqeKblY',
    appId: '1:72825511182:web:PLACEHOLDER',
    messagingSenderId: '72825511182',
    projectId: 'pickaboo-app',
    authDomain: 'pickaboo-app.firebaseapp.com',
    storageBucket: 'pickaboo-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBt9p3ih-v49m9KsNKcBfMpJxfV3Bs17lI',
    appId: '1:72825511182:android:6e2300ff764f49a3',
    messagingSenderId: '72825511182',
    projectId: 'pickaboo-app',
    storageBucket: 'pickaboo-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDb_YxftrBJCypzxA3YPCf94kUeFqeKblY',
    appId: '1:72825511182:ios:d3dda9257e42006e',
    messagingSenderId: '72825511182',
    projectId: 'pickaboo-app',
    storageBucket: 'pickaboo-app.appspot.com',
    iosBundleId: 'com.pickaboo.ios',
  );
}
