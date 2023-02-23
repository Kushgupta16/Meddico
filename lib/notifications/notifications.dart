import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:meddico/Models/pill.dart';

class Notifications {
   late BuildContext _context;

  Future<FlutterLocalNotificationsPlugin> initNotifies(
      BuildContext context) async {
    _context = context;

    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettings = new InitializationSettings(
      android: initializationSettingsAndroid,);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        new FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    onSelectNotification: SelectNotification);
    return flutterLocalNotificationsPlugin;
  }

  Future showNotifications(String title, String description, int time, int id,
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id.toInt(),
        title,
        description,
        tz.TZDateTime.now(tz.local).add(Duration(milliseconds: time)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'medicine_id', 'medicines', channelDescription: 'medicines_notification_channel',
                importance: Importance.high,
                priority: Priority.high,
                color: Colors.cyan)),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,);
  }

    Future removeNotify(int notifyId,
        FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
      try {
        return await flutterLocalNotificationsPlugin.cancel(notifyId);
      } catch (e) {
        return null;
      }
    }

    Future<dynamic>SelectNotification(String? payload) async {
      showDialog(
        context: _context,
        builder: (_) {
          return new AlertDialog(
            title: Text("Payload"),
            content: Text("Payload : $payload"),
          );
        },
      );
    }
  }

