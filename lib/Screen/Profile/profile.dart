import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    child: ListView(
    children: <Widget>[
    SizedBox(
    height: 20,
    ),
    nameTextField(),
    SizedBox(
    height: 20,
    ),
    professionTextField(),
    SizedBox(
    height: 20,
    ),
    dobField(),
    SizedBox(
    height: 20,
    ),
    titleTextField(),
    SizedBox(
    height: 20,
    ),
    aboutTextField(),
    SizedBox(
    height: 20,
    ),

    ]
    )
    )
    );
  }
}

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: 80,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),

        ],
      ),
    );
  }


  Widget nameTextField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),

      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.lightBlueAccent,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Name",
        labelStyle: TextStyle(color: Colors.lightBlueAccent),
        helperText: "Name can't be empty",
        hintText: "Dev Stack",
      ),
    );
  }

  Widget professionTextField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.lightBlueAccent,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Profession",
        labelStyle: TextStyle(color: Colors.lightBlueAccent),
        helperText: "Profession can't be empty",
        hintText: "Full Stack Developer",
      ),
    );
  }

  Widget dobField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.lightBlueAccent,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Date Of Birth",
        labelStyle: TextStyle(color: Colors.lightBlueAccent),
        helperText: "Provide DOB on dd/mm/yyyy",
        hintText: "01/01/2020",
      ),
    );
  }

  Widget titleTextField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.lightBlueAccent,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Title",
        labelStyle: TextStyle(color: Colors.lightBlueAccent),
        helperText: "It can't be empty",
        hintText: "Flutter Developer",
      ),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      maxLines: 4,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.lightBlueAccent,
              width: 2,
            )),
        labelText: "Allergen Info",
        labelStyle: TextStyle(color: Colors.lightBlueAccent),
        helperText: "Write about yourself",
        hintText: "I am Dev Stack",
      ),
    );
  } //
