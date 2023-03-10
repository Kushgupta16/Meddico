import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:meddico/Database/repository.dart';
import 'package:meddico/Models/medicine_type.dart';
import 'package:meddico/Models/pill.dart';
import 'package:meddico/Screen/Medicine/button.dart';
import 'package:meddico/Screen/Medicine/fields.dart';
import 'package:meddico/Screen/Medicine/medicinecard.dart';
import 'package:meddico/notifications/notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Medicine extends StatefulWidget {
  @override
  _AddNewMedicineState createState() => _AddNewMedicineState();
}

class _AddNewMedicineState extends State<Medicine> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> weightValues = ["pills", "ml", "mg"];

  final List<MedicineType> medicineTypes = [
    MedicineType("Syrup", Image.asset("lib/images/bottle.png"), true),
    MedicineType("Pill", Image.asset("lib/images/drug (1).png"), false),
    MedicineType("Tablet", Image.asset("lib/images/pills (1).png"), false),
    MedicineType("Syringe", Image.asset("lib/images/injection.png"), false),
  ];

  int howManyWeeks = 1;
  late String selectWeight;
  DateTime setDate = DateTime.now();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();


  final Repository _repository = Repository();
  final Notifications _notifications = Notifications();


  @override
  void initState() {
    super.initState();
    selectWeight = weightValues[0];
    initNotifies();
  }


  Future initNotifies() async =>
      flutterLocalNotificationsPlugin =
      await _notifications.initNotifies(context);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery
        .of(context)
        .size
        .height - 60.0;

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 30.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0),
                height: deviceHeight * 0.05,
                child: FittedBox(
                    child: Text(
                      "Add Pills",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: Colors.black),
                    )),
              ),
              Expanded(
                child: Container(
                  height: deviceHeight * 0.37,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: FormFields(
                          howManyWeeks,
                          selectWeight,
                          popUpMenuItemChanged,
                          sliderChanged,
                          nameController,
                          amountController)),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: deviceHeight * 0.035,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: FittedBox(
                      child: Text(
                        "Medicine form",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              Container(
                height: 100,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ...medicineTypes.map(
                            (type) => MedicineCard(type, medicineTypeClick))
                  ],
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              Container(
                width: double.infinity,
                height: deviceHeight * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        child: Button(
                          handler: () => openTimePicker(),
                          buttonChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                DateFormat.Hm().format(this.setDate),
                                style: TextStyle(
                                    fontSize: 32.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.access_time,
                                size: 30,
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                              )
                            ],
                          ),
                          color: Color.fromRGBO(7, 190, 200, 0.1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        child: Button(
                          handler: () => openDatePicker(),
                          buttonChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                DateFormat("dd.MM").format(this.setDate),
                                style: TextStyle(
                                    fontSize: 32.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.event,
                                size: 30,
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                              )
                            ],
                          ),
                          color: Color.fromRGBO(7, 190, 200, 0.1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: deviceHeight * 0.09,
                width: double.infinity,
                child: Button(
                  handler: () async => savePill(),
                  color: Theme
                      .of(context)
                      .primaryColor,
                  buttonChild: Text(
                    "Done",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void sliderChanged(double value) =>
      setState(() => this.howManyWeeks = value.round());

  void popUpMenuItemChanged(String value) =>
      setState(() => this.selectWeight = value);


  Future<void> openTimePicker() async {
    await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        helpText: "Choose Time")
        .then((value) {
      DateTime newDate = DateTime(
          setDate.year,
          setDate.month,
          setDate.day,
          value != null ? value.hour : setDate.hour,
          value != null ? value.minute : setDate.minute);
      setState(() => setDate = newDate);
      print(newDate.hour);
      print(newDate.minute);
    });
  }

  Future<void> openDatePicker() async {
    await showDatePicker(
        context: context,
        initialDate: setDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 100000)))
        .then((value) {
      DateTime newDate = DateTime(
          value != null ? value.year : setDate.year,
          value != null ? value.month : setDate.month,
          value != null ? value.day : setDate.day,
          setDate.hour,
          setDate.minute);
      setState(() => setDate = newDate);
      print(setDate.day);
      print(setDate.month);
      print(setDate.year);
    });
  }





  Future savePill() async {
      Pill pill = Pill(
        id: 1,
          amount: amountController.text,
          howManyWeeks: howManyWeeks,
          medicineForm: medicineTypes[medicineTypes.indexWhere((element) => element.isChoose == true)].name,
          name: nameController.text,
          time: setDate.millisecondsSinceEpoch,
          type: selectWeight,
          notifyId: Random().nextInt(10000000));

      for (int i = 0; i < howManyWeeks; i++) {
        dynamic result =
        await _repository.insertData("Pills", pill.pilltoMap());
        if (result != null) {
          tz.initializeTimeZones();
          tz.setLocalLocation(tz.getLocation('Europe/Warsaw'));
          await _notifications.showNotifications(pill.name, pill.amount + " " + pill.medicineForm + " " + pill.type, time,
              pill.notifyId,
              flutterLocalNotificationsPlugin);
          setDate = setDate.add(Duration(milliseconds: 604800000));
          pill.time = setDate.millisecondsSinceEpoch;
          pill.notifyId = Random().nextInt(10000000);
        }
      }


    }



  void medicineTypeClick(MedicineType medicine) {
    setState(() {
      medicineTypes.forEach((medicineType) => medicineType.isChoose = false);
      medicineTypes[medicineTypes.indexOf(medicine)].isChoose = true;
    });
  }


  int get time =>
      setDate.millisecondsSinceEpoch -
          tz.TZDateTime.now(tz.local).millisecondsSinceEpoch;
}

