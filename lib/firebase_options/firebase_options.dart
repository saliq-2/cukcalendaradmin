import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:909432165261:ios:131d7666b49cff3edae3c4',
        apiKey: 'AIzaSyCzQO_sgx0qMrxPZ3whVS5BKKj8sgwgRUo',
        projectId: 'cukashmir-23c02',
        messagingSenderId: '909432165261',
        iosBundleId: 'com.example.cuk',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:909432165261:android:134bcd7158f61d90dae3c4',
        apiKey: 'AIzaSyCF-AMUBlAJKB3kiImkNsxUyI9KtmNEeEA',
        projectId: 'cukashmir-23c02',
        messagingSenderId: '909432165261',
      );

    }

  }
}