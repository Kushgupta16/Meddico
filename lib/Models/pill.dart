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
    this.id,
    this.name,
    this.amount,
    this.type,
    this.howManyWeeks,
    this.medicineForm,
    this.time,
    this.notifyId
  });

  Map<String, dynamic>pilltoMap(){
    Map<String, dynamic> map= Map();
    map['id'] = this.id;
    map['name'] = this.name;
    map['amount'] = this.amount;
    map['type'] = this.type;
    map['howManyWeeks'] = this.howManyWeeks;
    map['medicineform'] = this.medicineForm;
    map['time'] = this.time;
    map['notifyId'] = this.notifyId;
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