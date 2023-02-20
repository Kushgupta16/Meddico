class Pill{
  int id;
  String name;
  String amount;
  String type;
  int howManyWeeks;
  String medicineForm;
  int time;
  int notifyId;

  Pill({
    required this.id,
    required this.name,
    required this.amount,
    required this.type,
    required this.howManyWeeks,
    required this.medicineForm,
    required this.time,
    required this.notifyId
  });

  Map<String, dynamic>pilltoMap(){
    Map<String, dynamic> map= {};
    map['id'] = id;
    map['name'] = name;
    map['amount'] = amount;
    map['type'] = type;
    map['howManyWeeks'] = howManyWeeks;
    map['medicineform'] = medicineForm;
    map['time'] = time;
    map['notifyId'] = notifyId;
    return map;
  }

  Pill pillMapToObject(Map<String, dynamic> pillMap) {
    return Pill(
        id: pillMap['id'],
        name: pillMap['name'],
        amount: pillMap['amount'],
        type: pillMap['type'],
        howManyWeeks: pillMap['howManyWeeks'],
        medicineForm: pillMap['medicineForm'],
        time: pillMap['time'],
        notifyId: pillMap['notifyId']);
  }

  String get image{
    switch(this.medicineForm){
      case "Syrup": return "lib/images/bottle.png"; break;
      case "Pill":return "lib/images/drug (1).png"; break;
      case "Tablet":return "lib/images/pills (1).png"; break;
      case "Syringe":return "lib/images/injection.png"; break;
      default : return "lib/images/drug (1).png"; break;
    }
  }
}