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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNj8XZ0z46Lvi5fffty7v6jtW6yeRs-kg',
    appId: '1:324754500620:android:2e96e30b3038a9db9a9229',
    messagingSenderId: '324754500620',
    projectId: 'patientmanagement-9046d',
    storageBucket: 'patientmanagement-9046d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArnJIlkETS66qIUEumRpC3_L2GTSykh_o',
    appId: '1:324754500620:ios:d901ccc20e48bb799a9229',
    messagingSenderId: '324754500620',
    projectId: 'patientmanagement-9046d',
    storageBucket: 'patientmanagement-9046d.appspot.com',
    iosBundleId: 'com.grazelgracia.patientManagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArnJIlkETS66qIUEumRpC3_L2GTSykh_o',
    appId: '1:324754500620:ios:d901ccc20e48bb799a9229',
    messagingSenderId: '324754500620',
    projectId: 'patientmanagement-9046d',
    storageBucket: 'patientmanagement-9046d.appspot.com',
    iosBundleId: 'com.grazelgracia.patientManagement',
  );
}
