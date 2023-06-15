import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../core/services/injection_container.dart';

class FcmHelper {
  FirebaseMessaging get _fireMsg => FirebaseMessaging.instance;

  @visibleForTesting
  FcmHelper();

  static FcmHelper instance = getIt.get<FcmHelper>();

  static void register() {
    getIt.registerFactory<FcmHelper>(() => FcmHelper());
  }

  Stream<RemoteMessage> get onMessage => FirebaseMessaging.onMessage;

  Stream<RemoteMessage> get onMessageOpenedApp => FirebaseMessaging.onMessageOpenedApp;

  Stream<String> get onTokenRefreshed => _fireMsg.onTokenRefresh;

  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future<void> init() async {
    if (kIsWeb) return;

    _fireMsg.setAutoInitEnabled(false);

    channel = const AndroidNotificationChannel(
      'app_notification_channel', // id
      'app Notifications Channel', // title
      description: 'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await _fireMsg.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<bool> requestNotificationPermission() async {
    final settings = await _fireMsg.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    return [
      AuthorizationStatus.authorized,
      AuthorizationStatus.provisional,
    ].contains(settings.authorizationStatus);
  }

  Future<bool> isNotificationPermissionGranted() async {
    final settings = await _fireMsg.getNotificationSettings();
    return [
      AuthorizationStatus.authorized,
      AuthorizationStatus.provisional,
    ].contains(settings.authorizationStatus);
  }

  Future<String?> getToken() {
    return _fireMsg.getToken(
      vapidKey:
          'BEyCDoBbLD2THnbZgmjDsOIvOYmxoqYZN7KAnY0olcAhWAK7JbNdsQgoLe_y0cNCs5F89Iilbmp9dM_8WKBgeRw',
    );
  }

  Future<void> resetInstance() {
    return _fireMsg.deleteToken();
  }

  void showNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;

    if (notification != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'app_icon',
          ),
        ),
      );
    }
  }
}
