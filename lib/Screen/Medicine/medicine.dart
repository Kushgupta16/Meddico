import 'package:flutter/material.dart';
import 'package:meddico/components/medcount.dart';
import 'package:quantity_input/quantity_input.dart';

class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  late TextEditingController nameController;
  late TextEditingController amountController;

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
  Widget build(BuildContext context) {
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
                child: Stack(
                  fit: StackFit.expand,
                  children: [
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
                    Column(
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
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 5, right: 12),
                            margin: EdgeInsets.only(top: 73.5, left: 12),
                            child: Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    blurRadius: 20,
                                    color: Colors.white.withOpacity(0.1))
                              ]),
                              child: TextFormField(
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
                              ),
                            ))
                      ],
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
                              margin: EdgeInsets.only(left: 76, top: 160),
                              child: QuantityInput(
                                inputWidth: 100,
                                buttonColor: Colors.white.withOpacity(0.9),
                                iconColor: Colors.lightBlueAccent,
                                value: simpleIntInput,
                                onChanged: (value) => setState(() =>
                                    simpleIntInput =
                                        int.parse(value.replaceAll(',', ''))),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}

class Title extends StatelessWidget {
  const Title({Key? key, required this.title, required this.isRequired})
      : super(key: key);
  final String title;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Text.rich(TextSpan(children: <TextSpan>[
        TextSpan(text: title, style: TextStyle(color: Colors.white)),
        TextSpan(
            text: isRequired ? " *" : "", style: TextStyle(color: Colors.white))
      ])),
    );
  }
}
