import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FcmService {
  Future<void> initFirebaseFCM()async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
    // use the returned token to send messages to users from your custom server
    String? token = await   FirebaseMessaging.instance.getToken(
      vapidKey: "BGpdLRs......",
    );
    print(token);
/*    late AndroidNotification channel;
    channel=const AndroidNotification(

    );*/

    ///foreground message
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print ('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        print('Message also contained a notification: ${message.notification?.title??""}');
      }
    });

//backgroundMassage
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  }
  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message,) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();
    FirebaseMessaging.instance.getInitialMessage().then((value) =>
    value != null
        ? message
        : "",);


    print("Handling a background message: ${message.messageId}");
  }
}