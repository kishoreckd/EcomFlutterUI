import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones(); // Initialize time zones
  tz.setLocalLocation(
      tz.getLocation('America/New_York')); // Set the local time zone

  AndroidInitializationSettings androidSettings =
      const AndroidInitializationSettings("@mipmap/ic_launcher");

  DarwinInitializationSettings iosSettings = const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestCriticalPermission: true,
    requestSoundPermission: true,
  );
  InitializationSettings initializationSettings = InitializationSettings(
    iOS: iosSettings,
    android: androidSettings,
  );
  bool? initialized =
      await notificationsPlugin.initialize(initializationSettings);

  print("Notification $initialized");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        // Other theme configurations...
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void showNotification() async {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      "notifications-youtube",
      "YouTube Notifications",
      priority: Priority.max,
      importance: Importance.max
    );

    DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notiDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails
    );

    DateTime scheduleDate = DateTime.now().add(Duration(seconds: 5));

    await notificationsPlugin.zonedSchedule(
      0,
      "Sample Notification",
      "This is a notification",
      tz.TZDateTime.from(scheduleDate, tz.local),
      notiDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
      androidAllowWhileIdle: true,
      payload: "notification-payload"
    );
  }

  void checkForNotification() async {
    NotificationAppLaunchDetails? details = await notificationsPlugin.getNotificationAppLaunchDetails();

    if(details != null) {
      if(details.didNotificationLaunchApp) {
        NotificationResponse? response = details.notificationResponse;

        if(response != null) {
          String? payload = response.payload;
          print("Notification Payload: $payload");
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    checkForNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showNotification,
        child: Icon(Icons.notification_add),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}