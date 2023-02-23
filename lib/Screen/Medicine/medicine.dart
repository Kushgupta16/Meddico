import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meddico/Models/medicine_type.dart';
import 'package:meddico/Models/pill.dart';
import 'package:meddico/Screen/Medicine/button.dart';
import 'package:meddico/Screen/Medicine/fields.dart';
import 'package:meddico/Screen/Medicine/medicinecard.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:meddico/notifications/notifications.dart';


class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;


<<<<<<< Updated upstream
=======


>>>>>>> Stashed changes
  final List<MedicineType> medicineTypes = [
    MedicineType("Syrup", Image.asset("lib/images/bottle.png"), true),
    MedicineType("Pill", Image.asset("lib/images/drug (1).png"), false),
    MedicineType("Tablet", Image.asset("lib/images/pills (1).png"), false),
    MedicineType("Syringe", Image.asset("lib/images/injection.png"), false),
  ];

  final List<String> weightValues = ["pills", "ml", "mg"];

  int howManyWeeks = 1;
  late String selectWeight;
  DateTime setDate = DateTime.now();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

<<<<<<< Updated upstream

  Future initNotifies() async => flutterLocalNotificationsPlugin =
=======
  final Repository _repository = Repository();
  final Notifications _notifications = Notifications();


  Future initNotifies() async =>
      flutterLocalNotificationsPlugin =
>>>>>>> Stashed changes
      await _notifications.initNotifies(context);

  @override
  void initState() {
    super.initState();
    selectWeight = weightValues[0];
    initNotifies();
  }

<<<<<<< Updated upstream

  Future initNotifies() async => flutterLocalNotificationsPlugin =
  await _notifications.initNotifies(context);


  void medicineTypeClick(MedicineType medicine) {
    setState(() {
      medicineTypes.forEach((medicineType) => medicineType.isChoose = false);
      medicineTypes[medicineTypes.indexOf(medicine)].isChoose = true;
    });
  }

  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);
    return Scaffold(
=======
  @override
  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
>>>>>>> Stashed changes
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              Image.asset(
                'lib/images/medicinepage.jpeg',
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 24, top: 36),
                child: Text('Set Medicine',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 39,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, right: 13, left: 13),
                  height: 1,
                  child:
                  Flex(
                    mainAxisSize: MainAxisSize.min,
                      direction: Axis.vertical,
                      children: [
                    Container(
                      height:12,
                      width: 11,

                      decoration: BoxDecoration(
                          color: Colors.lightGreenAccent.shade100,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                offset: Offset(2, 2),
                                color: Colors.transparent.withOpacity(0.4))
                          ]),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: FormFields(
                            howManyWeeks,
                            selectWeight,
                            popUpMenuItemChanged,
                            sliderChanged,
                            nameController,
                            amountController),
                      ),
                    ),
                    Container(

                        child: SizedBox(
                          height: 1.5,
                          child: ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                ...medicineTypes.map((type) =>
                                    MedicineCard(type, medicineTypeClick))
                              ]
                          ),
                        )
                    ), //pill type select

                    Container(
                      child: Button(
                        handler: () => openTimePicker(),
                        buttonChild: Row(
                          children: [
                            Text(DateFormat.Hm().format(this.setDate),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            Icon(
                              Icons.access_time_filled,
                              size: 30,
                              color: Colors.cyanAccent,
                            )
                          ],
                        ),
                        color: Color.fromRGBO(7, 190, 200, 0.1),
                      ),

                    ),
                    Expanded(
                        child: Container(
                          child: Button(
                            handler: () => openDatePicker(),
                            buttonChild: Row(
                              children: [
                                Text(
                                  DataFormat("dd.MM").format(this.setDate),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(Icons.event,
                                  size: 30,
                                  color: Colors.blue,)
                              ],
                            ),
                            color: Color.fromRGBO(7, 190, 200, 0.1),
                          ),
                        )),
                    Container(
                        child: Button(
                          handler: () => savePill(),
                          buttonChild: Icon(Icons.done_outline_outlined,
                            size: 2,
                            color: Colors.black,),
                          color: Colors.green,
                        )
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }
<<<<<<< Updated upstream
}
Future savePill() async {
  Pill pill = Pill(
    id: nameController.text,
      amount: amountController.text,
      howManyWeeks: howManyWeeks,
      medicineForm: medicineTypes[
              medicineTypes.indexWhere((element) => element.isChoose == true)]
          .name,
      name: nameController.text,
      time: setDate.millisecondsSinceEpoch,
      type: selectWeight,
      notifyId: Random().nextInt(10000000));

  for (int i = 0; i < howManyWeeks; i++) {
    dynamic result = await _repo.insertData("Pills", pill.pilltoMap());
    if (result == null) {
      snackbar.showSnack("Something went wrong", _scaffoldKey, null);
      return;
    } else {
      tz.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation('Europe/Warsaw'));
      await _notifications.showNotification(
=======

  Future savePill() async {
    Pill pill = Pill(
        amount: amountController.text,
        howManyWeeks: howManyWeeks,
        medicineForm: medicineTypes[
        medicineTypes.indexWhere((element) => element.isChoose == true)].name,
        name: nameController.text,
        time: setDate.millisecondsSinceEpoch,
        type: selectWeight,
        notifyId: Random().nextInt(10000000),
        id: 1); //ID??

    for (int i = 0; i < howManyWeeks; i++) {
      dynamic result = await _repository.insertData(
          "Pills", pill.pilltoMap());

      tz.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation('Europe/Warsaw'));
      await _notifications.showNotifications(
>>>>>>> Stashed changes
          pill.name,
          pill.amount + " " + pill.medicineForm + " " + pill.type,
          time,
          pill.notifyId,
          flutterLocalNotificationsPlugin);
      setDate = setDate.add(Duration(milliseconds: 604800000));
      pill.time = setDate.millisecondsSinceEpoch;
      pill.notifyId = Random().nextInt(10000000);
    }
  }
<<<<<<< Updated upstream
  snackbar.showSnack("Saved", _scaffoldKey, null);
  Navigator.pop(context);
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
=======



  void medicineTypeClick(MedicineType medicine) {
    setState(() {
      medicineTypes.forEach((medicineType) => medicineType.isChoose = false);
      medicineTypes[medicineTypes.indexOf(medicine)].isChoose = true;
    });
  }

  int get time =>
      setDate.millisecondsSinceEpoch -
          tz.TZDateTime
              .now(tz.local)
              .millisecondsSinceEpoch;

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
>>>>>>> Stashed changes
}

