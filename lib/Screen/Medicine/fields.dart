import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meddico/Models/medicine_type.dart';
import 'package:meddico/Models/pill.dart';
import 'package:meddico/Screen/Medicine/medicine.dart';
import 'package:meddico/Screen/Medicine/medicinecard.dart';
import 'package:quantity_input/quantity_input.dart';

class FormFields extends StatelessWidget {
  final List<String> weightValues = ["pills", "ml", "mg"];
  final int howManyWeeks;
  final String selectWeight;
  final Function onPopUpMenuChanged, onSliderChanged;
  final TextEditingController nameController;
  final TextEditingController amountController;
  FormFields(this.howManyWeeks,this.selectWeight,this.onPopUpMenuChanged,this.onSliderChanged,this.nameController,this.amountController);


  final List<MedicineType> medicineTypes = [
    MedicineType("Syrup", Image.asset("lib/images/bottle.png"), true),
    MedicineType("Pill", Image.asset("lib/images/drug (1).png"), false),
    MedicineType("Tablet", Image.asset("lib/images/pills (1).png"), false),
    MedicineType("Syringe", Image.asset("lib/images/injection.png"), false),
  ];


  @override
  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);
    return LayoutBuilder(
        builder: (context,constrains)=>Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 35,
                  ),
                  padding: EdgeInsets.only(left: 35, right: 50),
                  child: Text('Pills Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 19)),
                ),
                Container(
                    height: 12,
                    child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          ...medicineTypes.map((type) =>
                              MedicineCard(type, medicineTypeClick))
                        ])),
              ],
            ),
                Container(
              child: Column(
               children: [
          Container(
                padding: EdgeInsets.only(left: 5, right: 12),
                margin: EdgeInsets.only(top: 83.5, left: 12),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: Colors.white.withOpacity(0.1))
                  ]),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: nameController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onFieldSubmitted: (val) => focus.nextFocus(),
                  ),
                ))
        ],
      ),
            ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 171),
            padding: EdgeInsets.only(left: 35),
            child: Text(
              'Amount',
              style: TextStyle(
                  fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 5, right: 12),
                  margin: EdgeInsets.only(left: 76, top: 160),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          color: Colors.white.withOpacity(0.1))
                    ]),
                    child: TextFormField(
                      controller: amountController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onFieldSubmitted: (val)=>focus.unfocus(),
                    ),
                  )),
              Flexible(flex: 1,
                  child: Container(
                    child: DropdownButtonFormField(
                      onTap: ()=>focus.unfocus(),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 20.0),
                          labelText: "Type",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  width: 0.5, color: Colors.grey))),
                      items: weightValues.map((weight) => DropdownMenuItem(
                        child: Text(weight),
                        value: weight,
                      ))
                          .toList(),
                      onChanged: (value) => this.onPopUpMenuChanged(value),
                      value: selectWeight,
                    ),
                  ))
            ],
          ),
        ],
      ),]
        )
    );

  }
}