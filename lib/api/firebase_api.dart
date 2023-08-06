import 'package:firebase_messaging/firebase_messaging.dart';
Future<void > handleBackgroundMessage(RemoteMessage message) async{
  print('Titile ${message.notification?.title}');
  print('Titile ${message.notification?.body}');
  print('Payload: ${message.data}');
}
class FirebaseApi
{
  final _firebaseMessaging=FirebaseMessaging.instance;
  Future<void> initNotifications() async
  {
    await _firebaseMessaging.requestPermission();
    final fCMToken=await _firebaseMessaging.getToken();
    print("Token $fCMToken");
    FirebaseMessaging.onBackgroundMessage((handleBackgroundMessage));
  }
}