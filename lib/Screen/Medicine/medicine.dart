import 'package:flutter/material.dart';
import 'package:meddico/Models/medicine_type.dart';
import 'package:meddico/Models/pill.dart';
import 'package:meddico/Screen/Medicine/fields.dart';
import 'package:meddico/Screen/Medicine/medicinecard.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';

class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  late TextEditingController nameController;
  late TextEditingController amountController;

  final List<MedicineType> medicineTypes = [
    MedicineType("Syrup", Image.asset("lib/images/bottle.png"), true),
    MedicineType("Pill", Image.asset("lib/images/drug (1).png"), false),
    MedicineType("Tablet", Image.asset("lib/images/pills (1).png"), false),
    MedicineType("Syringe", Image.asset("lib/images/injection.png"), false),
  ];

  int simpleIntInput = 1;
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    amountController.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    amountController = TextEditingController();
  }

  void medicineTypeClick(MedicineType medicine) {
    setState(() {
      medicineTypes.forEach((medicineType) => medicineType.isChoose = false);
      medicineTypes[medicineTypes.indexOf(medicine)].isChoose = true;
    });
  }

  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(23, 23, 23, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Image.asset(
                'lib/images/medicinepage.jpeg',
                height: 500,
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
                  margin: EdgeInsets.only(top: 420, right: 13, left: 13),
                  height: 400,
                  child: Stack(fit: StackFit.expand, children: [
                    Container(
                      padding: EdgeInsets.only(left: 50, right: 50),
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
                      height: 12,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: FormFields(
                            howManyWeeks,
                            selectWeight,
                            popUpMenuItemChanged,
                            sliderChanged,
                            nameController,
                            amountController),
                      ),
                    ),
                    Container()
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}

Future savePill() async {
  Pill pill = Pill(
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
    dynamic result = await _repo.insertData("Pills", pill.pillToMap());
    if (result == null) {
      snackbar.showSnack("Something went wrong", _scaffoldKey, null);
      return;
    } else {
      tz.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation('Europe/Warsaw'));
      await _notifications.showNotification(
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
}
