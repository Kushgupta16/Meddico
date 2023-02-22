import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meddico/Models/pill.dart';
import 'package:intl/intl.dart';
import 'package:meddico/notifications/notifications.dart';

class Medicine_Card extends StatelessWidget {

  final Pill medicine;
  final Function setData;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Medicine_Card(this.medicine, this.setData,
      this.flutterLocalNotificationsPlugin);

  @override
  Widget build(BuildContext context) {
    final bool isEnd = DateTime
        .now()
        .millisecondsSinceEpoch > medicine.time;

    return Card(
      elevation: 2.8,
      margin: EdgeInsets.symmetric(vertical: 7),
      color: Colors.white,
      child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),),
          onLongPress: () =>
              _showDeleteDialog(
                  context, medicine.name, medicine.id, medicine.notifyId),
          contentPadding:
          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          title: Text(
            medicine.name,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: isEnd ? TextDecoration.lineThrough : null),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            "${medicine.amount} ${medicine.medicineForm}",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                decoration: isEnd ? TextDecoration.lineThrough : null),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                DateFormat("HH:mm").format(
                    DateTime.fromMillisecondsSinceEpoch(medicine.time)),
              )
            ],
          ),
          leading: Container(
            width: 60.0,
            height: 60.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      isEnd ? Colors.white : Colors.transparent,
                      BlendMode.saturation
                  ),
                  child: Image.asset(
                      medicine.image)
              ),
            ),
          )
      ),
    );
  }


  void _showDeleteDialog(BuildContext context, String medicineName,
      int medicineId, int notifyId) {
    showDialog(context: context,
      builder: (context) =>
          AlertDialog(
            title: Text("Delete ?"),
            content: Text("Are you sure to delete $medicineName medicine?"),
            contentTextStyle:
            TextStyle(
                fontSize: 16,
                color: Colors.grey[500]),
            actions: [
              TextButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Delete",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () async {
                  await Repository().deleteData('Pills', medicineId);
                  await Notifications().removeNotify(
                      notifyId, flutterLocalNotificationsPlugin);
                  setData();
                  Navigator.pop(context);
                },
              )
            ],
          ),
    );
  }

}