import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:to_do/models/task.dart';
import 'package:to_do/ui/pages/notification_screen.dart';

/*class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initializeNotifications() async {
    tz.initializeTimeZones();
    // tz.setLocalLocation(tz.getLocation(timeZoneName));
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('todo');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          sound: true,
          alert: true,
          badge: true,
        );
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Get.to(NotificationScreen(payload: payload!));
  }

  void displayNotification(
      {required String title, required String body}) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            icon: 'todo',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    DarwinNotificationDetails iosNotificationDetails =
        const DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', notificationDetails,
        payload: 'Default_Sound');
  }

  Future<void> requestAndroidPermissions() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  void scheduledNotification() async {
    await requestAndroidPermissions();
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'scheduled title',
        'scheduled body',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    Get.dialog(
      Text(body!),
    );
  }
}
*/

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  String selectedNotificationPayload = '';

  final BehaviorSubject<String> selectNotificationSubject =
      BehaviorSubject<String>();
  initializeNotification() async {
    tz.initializeTimeZones();
    _configureSelectNotificationSubject();
    await _configureLocalTimeZone();
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('todo');

    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      // onDidReceiveLocalNotification: (String? payload) async {
      //   if (payload != null) {
      //     debugPrint('notification payload: $payload');
      //   }
      //   selectNotificationSubject.add(payload!);
      // },
    );
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Get.to(NotificationScreen(payload: payload!));
  }

  displayNotification({required String title, required String body}) async {
    print('doing test');
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high);
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: const DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  cancelNotification(Task task) async {
    await flutterLocalNotificationsPlugin.cancel(task.id!);
  }
  cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  scheduledNotification(int hour, int minutes, Task task) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      task.id!,
      task.title,
      task.note,
      //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      _nextInstanceOfTenAM(
          hour, minutes, task.remind!, task.repeat!, task.date!),
      const NotificationDetails(
        android: AndroidNotificationDetails(
            'your channel id', 'your channel name',
            channelDescription: 'your channel description'),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: '${task.title}|${task.note}|${task.startTime}|',
    );
  }

  tz.TZDateTime _nextInstanceOfTenAM(
      int hour, int minutes, int remind, String repeat, String date) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    DateTime formattedDate = DateFormat.yMd().parse(date);
    final tz.TZDateTime fd = tz.TZDateTime.from(formattedDate, tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, fd.year, fd.month, fd.day, hour, minutes);

    scheduledDate = afterRemind(remind, scheduledDate);

    if (scheduledDate.isBefore(now)) {
      if (repeat == 'Daily') {
        scheduledDate = tz.TZDateTime(
            tz.local, now.year, now.month, (formattedDate.day) + 1);
      } else if (repeat == 'Weekly') {
        scheduledDate = tz.TZDateTime(
            tz.local, now.year, now.month, (formattedDate.day) + 7);
      } else if (repeat == 'Monthly') {
        scheduledDate = tz.TZDateTime(
            tz.local, now.year, (formattedDate.month) + 1, formattedDate.day);
      }
      scheduledDate = afterRemind(remind, scheduledDate);
    }

    return scheduledDate;
  }

  tz.TZDateTime afterRemind(int remind, tz.TZDateTime scheduledDate) {
    if (remind == 5) {
      scheduledDate = scheduledDate.subtract(const Duration(minutes: 5));
    } else if (remind == 10) {
      scheduledDate = scheduledDate.subtract(const Duration(minutes: 10));
    } else if (remind == 15) {
      scheduledDate = scheduledDate.subtract(const Duration(minutes: 15));
    } else if (remind == 20) {
      scheduledDate = scheduledDate.subtract(const Duration(minutes: 20));
    } else if (remind == 30) {
      scheduledDate = scheduledDate.subtract(const Duration(minutes: 30));
    } else if (remind == 45) {
      scheduledDate = scheduledDate.subtract(const Duration(minutes: 45));
    } else {
      scheduledDate = scheduledDate.subtract(const Duration(minutes: 60));
    }
    return scheduledDate;
  }

  Future<void> requestAndroidPermissions() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    DateTime now = DateTime.now();
    String timeZoneName = now.timeZoneName;
    // tz.setLocalLocation(tz.getLocation(timeZoneName));
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
  }

/*   Future selectNotification(String? payload) async {
    if (payload != null) {
      //selectedNotificationPayload = "The best";
      selectNotificationSubject.add(payload);
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }
    Get.to(() => SecondScreen(selectedNotificationPayload));
  } */

//Older IOS
  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    /* showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Title'),
        content: const Text('Body'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Container(color: Colors.white),
                ),
              );
            },
          )
        ],
      ),
    ); 
 */
    Get.dialog(Text(body!));
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String payload) async {
      debugPrint('My payload is $payload');
      await Get.to(() => NotificationScreen(payload: payload));
    });
  }
}
